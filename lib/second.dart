import 'package:flutter/material.dart';
import 'package:untitled2/Article_model_class.dart';

class second extends StatelessWidget {
  final Article ?article;

  second({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "News App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
            article!.title.toString(),
            style: TextStyle(
                    color: Colors.black,
                    fontSize: 31,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              article!.urlToImage != null?
              Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          article!.urlToImage.toString(),
                        ),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: Colors.blueGrey, width: 2)),
              ):
              Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://imgeng.jagran.com/images//2022/aug/breaking-news-21661047276000.jpg",
                        ),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: Colors.blueGrey, width: 2)),
              ),
              SizedBox(height: 8),
              Text(
                "Author : ${article!.author.toString()}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Published At : ${article!.publishedAt.toString()}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 11),
              Text(
                article!.content.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,),
              ),

            ],

          ),
        ),
      ),
    );
  }
}

