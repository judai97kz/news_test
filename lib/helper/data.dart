import '../model/categori_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoriesname = "Bussines";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1603357465999-241beecc2629?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=932&q=80";
  category.add(categoryModel);
  CategoryModel categoryModel1 = new CategoryModel();
  categoryModel1.categoriesname = "Entertaiment";
  categoryModel1.imageUrl = "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel1);
  CategoryModel categoryModel2 = new CategoryModel();
  categoryModel2.categoriesname = "Entertaiment";
  categoryModel2.imageUrl = "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel2);
  CategoryModel categoryModel3 = new CategoryModel();
  categoryModel3.categoriesname = "Entertaiment";
  categoryModel3.imageUrl = "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel3);
  return category;
}