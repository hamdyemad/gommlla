<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\CategoryCollection;
use App\Models\BusinessSetting;
use App\Models\Category;
use App\HomeCategory;

class CategoryController extends Controller
{

    public function index()
    {
        return new CategoryCollection(Category::all());
    }

    public function featured()
    {
        return new CategoryCollection(Category::where('featured', 1)->get());
    }

    public function home()
    {
      $homepageCategories =HomeCategory::where('status', 1)->get();
       
        foreach($homepageCategories as $category){
          
           $category['name']= $category->category->name;
          
         $category['subsubcategories']=json_decode($category->subsubcategories);
          
          $category['subsubcategories']=\App\SubSubCategory::wherein('id', $category['subsubcategories'])->get();
          }
       
        
        
         return [
             'data'=>$homepageCategories,
            'success' => true,
            'status' => 200
        ];
    }
}
