import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_/models/article_modle.dart';
import 'package:news_app_/models/category_model.dart';
import 'package:news_app_/models/slider_model.dart';
import 'package:news_app_/pages/article_view.dart';
import 'package:news_app_/services/news.dart';
import 'package:news_app_/services/slider_data.dart' as custom_slider;

class AllNews extends StatefulWidget {
  String news;
  AllNews({required this.news});
 

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
   List<CategoryModel> categories = [];
  List<SliderModel> slider = [];
List<ArticleModel> articles = [];

  
  @override

   void initState() {
    
    getSlider();
    List<ArticleModel> articles = [];
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      
    });
    
  }

  getSlider() async {
    custom_slider.Slider slider = custom_slider.Slider();
    await slider.getSlider();
    this.slider = slider.sliders;
    setState(() {
      
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news+"News", style: TextStyle(fontWeight: FontWeight.bold,), ),
      ),
      body: Container(
        child: ListView.builder(
                          itemCount: widget.news == "Breaking"? slider.length : articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return AllNewsSection(
                             
                              Image: widget.news == "Breaking"? slider[index].urlToImage! : articles[index].urlToImage!,
                              title:widget.news == "Breaking"? slider[index].title! : articles[index].title!,
                              desc:widget.news == "Breaking"? slider[index].description! : articles[index].description!,
                              url: widget.news == "Breaking"? slider[index].url! : articles[index].url!,

                            );
                          },
                        ),
      ),
    );

  }
}



class AllNewsSection extends StatelessWidget {
  String Image, desc, title, url;
  AllNewsSection({required this.Image, required this.desc, required this.title,required this.url});
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