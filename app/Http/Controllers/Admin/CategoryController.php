<?php


namespace App\Http\Controllers\Admin;


use App\Http\Controllers\BaseController;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class CategoryController extends BaseController
{
    private $model;

    public function __construct()
    {
        $this->model = new Category();
    }

    public function index()
    {
        $categories = $this->model->getAll();
        $parent_categories = $this->model->getItemParents()->keyBy('id');

        $data_items = $categories->map(function($category, $key) use ($parent_categories) {
            $data = new \stdClass();
            $data->id = $category->id;
            $data->stt = $key+1;
            $data->name = @$category->name;
            $data->icon = @$category->icon;
            $data->priority = @$category->priority;
            $data->status = @$category->is_active;
            $data->parent = isset($parent_categories[$category->parent_id]) ? $parent_categories[$category->parent_id]->name : '';
            $data->parent_id = @$category->parent_id;
            return $data;
        })->toJson();

        return view('admin.categories.index', compact('data_items', 'parent_categories'));
    }

    public function create()
    {
        $is_update = false;
        $parent_categories = $this->model->getItemParents()->keyBy('id');
        return view('admin.categories.form', compact('is_update', 'parent_categories'));
    }

    public function store(Request $request)
    {
        $this->validate($request,
            [
                'name' => 'required|max:255',
                'icon' => 'max:20',
                'description' => 'max:1000',
            ],
            [
                'name.required' => 'Vui lòng nhập tên danh mục',
                'name.max' => 'Tên danh mục không quá 255 ký tự',
                'icon.max' => 'Icon không quá 50 ký tự',
                'description.max' => 'Mô tả không quá 1000 ký tự',
            ]);
        $data = $request->all();
        $parameters = $this->model->initParameters();
        $parameters['code'] = $this->model->getCodeUnique("category");
        $parameters['name'] = $data['name'] ?? '';
        $parameters['parent_id'] = $data['parent_id'] ?? 0;
        $parameters['parent_id'] = $data['parent_id'] ?? 0;
        $parameters['icon'] = $data['icon'] ?? '';
        $parameters['description'] = isset($data['description']) ? html_entity_decode($data['description']) : '';
        $parameters['priority'] = isset($data['priority']) ? $data['priority'] : 0;
        $parameters['status'] = isset($data['status']) ? 1 : 0;

        $data_item = $this->model->create($parameters);
        if (!empty($data_item)) {
            Session::flash('success', 'Thêm mới danh mục thành công');
            return redirect()->back();
        }
        return redirect()->back()->withErrors('Thêm mới danh mục thất bại');
    }

    public function show()
    {

    }

    public function edit(Request $request)
    {
        $id = $request->id ?? 0;
        $data_item = $this->model->getInfoById($id);
        if(empty($data_item))
            return redirect()->back()->withErrors('Không tìm thấy danh mục');
        $is_update = true;
        $parent_categories = $this->model->getItemParents()->keyBy('id');
        return view('admin.categories.form', compact('is_update', 'parent_categories','data_item'));
    }

    public function update()
    {

    }

    public function destroy()
    {

    }
}