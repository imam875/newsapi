import 'package:flutter/material.dart';
import 'package:project_news_app/Informations.dart';
import 'package:project_news_app/NewsApi/newsapi.dart';
import 'package:project_news_app/NewsApi/nsHelper.dart';
import 'package:project_news_app/khusi/khusi.dart';
import 'package:project_news_app/khusi/rakshusi.dart';

class Imam extends StatefulWidget {
  const Imam({Key? key}) : super(key: key);

  @override
  _ImamState createState() => _ImamState();
}

class _ImamState extends State<Imam> {
  List<khusi> khusiList = <khusi>[];
  List<Articles> _articleList = <Articles>[];




  recivedArticles()async{
    nsHelper NShelper = nsHelper();
    await NShelper.getArticles();

    setState(() {
      _articleList = NShelper.articleList;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    khusiList = rakhos();
    recivedArticles();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Api'),
      ),
      body: Column(
          children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .12,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: khusiList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>inform(khusiList[index].fbprofile)
                            )
                        );
                      },
                      child: Container(
                        child: Column(
                            children: [
                          CircleAvatar(
                              maxRadius: 34,
                              backgroundImage:
                                  NetworkImage(khusiList[index].ImageURL),

                          ),
                          Text(khusiList[index].name),
                        ]),
                      ),
                    ),
                  );
                }),
          ),
        ),
        Container(margin: EdgeInsets.only(left: 8,right: 8),
          height:540,
          child: ListView.builder(
              itemCount: _articleList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
            return InkWell(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * .27,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(borderRadius: BorderRadius.circular(10),
                            child: Image.network(_articleList[index].urlToImage.toString(),
                            fit: BoxFit.fill,
                            ),
                          )),

                      Container(
                        alignment: Alignment.bottomRight,
                        height: MediaQuery.of(context).size.height * .25,
                        child: Text(_articleList[index].publishedAt.toString(),
                        style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .10,
                    child: Text(_articleList[index].title.toString(),style: TextStyle(fontSize: 24,color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .20,
                    child: Text(_articleList[index].description.toString(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => inform(
                        _articleList[index].url.toString()
                    )));
              },
            );
          }),
        )
      ]),
    );
  }
}
