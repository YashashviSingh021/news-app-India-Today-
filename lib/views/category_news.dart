import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List <ArticleModel> articles =new List<ArticleModel>();
  bool _loading =true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategorieNews();
  }
  getCategorieNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'India',
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
            ),
            //SizedBox(width: 8,),
            Text(
              'Today',
              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ))
          : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            children: <Widget>[
              ///blogs

              Container(
                padding: EdgeInsets.only(top: 16),
                //height: 540,
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              )
            ],
        ),
      ),
          ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc,url;

  BlogTile(
      {@required this.imageUrl, @required this.title, @required this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> ArticleView(
              blogUrl: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 18),
        child: Column(
          children: <Widget>[
            ClipRRect(

                borderRadius: BorderRadius.circular(6),
                child:url != null ? Image.network(imageUrl): Container()),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
