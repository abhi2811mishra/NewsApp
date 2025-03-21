// ignore_for_file: empty_constructor_bodies, must_be_immutable, unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_/models/show_category.dart';
import 'package:news_app_/pages/article_view.dart';
import 'package:news_app_/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories.cast<ShowCategoryModel>();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        elevation: 0.0,
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ShowCategory(
                             
                              Image: categories[index].urlToImage!,
                              title: categories[index].title!,
                              desc: categories[index].description!,
                              url: categories[index].url!,

                            );
                          },
                        ),
                      ),
    );
  }
}

class ShowCategory extends StatelessWidget {
  String Image, desc, title, url;
  ShowCategory({required this.Image, required this.desc, required this.title,required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: Image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.0,),
      
            Text(title,style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
            Text(desc,maxLines: 3,),
            SizedBox(height: 20.0,)
          ],
        ),
      ),
    );
  }
}
