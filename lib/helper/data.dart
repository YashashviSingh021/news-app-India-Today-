import 'package:flutter/foundation.dart';
import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category =new List<CategoryModel>();
  CategoryModel categoryModel =new CategoryModel();


  //1
  categoryModel.categoryName='Business';
  categoryModel.imageUrl='assets/bussiness.jpg';
  category.add(categoryModel);

  //2

  categoryModel=new CategoryModel();
  categoryModel.categoryName='Entertainment';
  categoryModel.imageUrl='assets/entertainment.jpg';
  category.add(categoryModel);



//  - assets/bussiness.jpg
//      - assets/entertainment.jpg
//      - assets/general.jpg
//      - assets/health.jpg
//      - assets/science.jpg
//      - assets/sports.jpg
//      - assets/technology.jpg

  //3

  categoryModel=new CategoryModel();
  categoryModel.categoryName='General';
  categoryModel.imageUrl='assets/general.jpg';
  category.add(categoryModel);

  //4

  categoryModel=new CategoryModel();
  categoryModel.categoryName='Health';
  categoryModel.imageUrl='assets/health.jpg';
  category.add(categoryModel);


  //5

  categoryModel=new CategoryModel();
  categoryModel.categoryName='Science';
  categoryModel.imageUrl='assets/science.jpg';
  category.add(categoryModel);

  //6

  categoryModel=new CategoryModel();
  categoryModel.categoryName='Sports';
  categoryModel.imageUrl='assets/sports.jpg';
  category.add(categoryModel);

  //7

  categoryModel=new CategoryModel();
  categoryModel.categoryName='Technology';
  categoryModel.imageUrl='assets/technology.jpg';
  category.add(categoryModel);

  return category;

}