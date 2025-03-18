

import 'package:news_app_/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://static-cse.canva.com/blob/1218986/Affordablemarketingideasforyoursmallbusiness_featuredimage.jpg";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://t4.ftcdn.net/jpg/02/16/46/81/360_F_216468131_xa78oKcQsamgGnuQxpYcMJjVxeB3UM1H.jpg";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://etvbharatimages.akamaized.net/etvbharat/prod-images/28-01-2025/1200-675-23417396-605-23417396-1738029343588.jpg";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://www.hordengrouppractice.uk/wp-content/uploads/elementor/thumbs/Health_News-ox75tzn36l4av2xiqevm4pp1tseb7d0amuloycr0yc.jpg";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://thumbs.dreamstime.com/b/ai-machine-learning-hands-robot-human-touching-big-data-network-connection-background-science-artificial-intelligence-172987598.jpg";
  category.add(categoryModel);


  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://cdn.britannica.com/22/238522-050-F29FD74E/FIFA-2022-World-Cup-Argentina.jpg";
  category.add(categoryModel);

      return category;
}