import 'package:flutter/material.dart';
import 'package:untitled2/Api_request_response.dart';
import 'package:untitled2/Article_model_class.dart';
import 'package:untitled2/second.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  ApiService client = ApiService();

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
        body: FutureBuilder<List<Article>>(
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot)
          {
            if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var articles = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(11),
                      child: InkWell(onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => second(article:articles,)));
                      },
                        child: Column(children: [

                          snapshot.data![index].urlToImage != null?
                          Container(
                            height: 150,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot.data![index].urlToImage.toString(),
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
                          SizedBox(height: 10),
                          Text(
                            snapshot.data![index].title.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 9),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Row(mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data![index].publishedAt.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.favorite_border),
                                      SizedBox(width: 8),
                                      Icon(Icons.share),
                                      SizedBox(width: 8),
                                      Icon(Icons.more_vert),
                                    ],
                                  )
                                ]),
                          ),
                        ]),
                      ),
                    );
                  }),
            );
            }
            print(snapshot.data);
            print(snapshot.hasData);

            return Center(child: CircularProgressIndicator()
            );

          }));
  }
}
