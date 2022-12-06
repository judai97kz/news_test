import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/helper/data.dart';
import 'package:untitled10/helper/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:untitled10/views/article_view.dart';
import '../model/article_model.dart';
import '../model/categori_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  ScrollController _controller = new ScrollController();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
      if (articles.length > 0) {
        for (int i = 0; i < articles.length; i++) {
          print(articles[i].title);
        }
      } else {
        print(null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _loading ? Center(child: CircularProgressIndicator(),) : Container(
          child: Column(
            children: [
              SingleChildScrollView(
                  child: Container(
                height: 100,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: CategoryTitle(categories[index].imageUrl,
                            categories[index].categoriesname),
                      );
                    }),
              )),
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                  child: ListView.builder(
                      controller: _controller,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: BlogTile(
                              articles[index].urlToImage!,
                              articles[index].title!,
                              articles[index].description!,
                            articles[index].url!
                          ),
                        );
                      }),
                )),
              ),
            ],
          ),
        ));
  }
}

class CategoryTitle extends StatelessWidget {
  final imageUrl, categoriesName;

  CategoryTitle(this.imageUrl, this.categoriesName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(categoriesName)));
      },
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                )),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child:
                  Text(categoriesName, style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc,url;
  BlogTile(this.imageUrl, this.title, this.desc , this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [ClipRRect(
            borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)), Text(title,style: TextStyle(fontSize: 17,color: Colors.black87,fontWeight: FontWeight.w600),), Text(desc,style: TextStyle(color: Colors.black38),)],
        ),
      ),
    );
  }
}
