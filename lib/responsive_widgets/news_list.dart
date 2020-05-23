import 'package:flutter/material.dart';
import 'package:nepal_corona_update/models/news_model.dart';
import 'dart:js' as js;

class NewsList extends StatefulWidget {
  final AsyncSnapshot<List<NewsModel>> snapshot;
  NewsList({this.snapshot});
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {


  @override
  Widget build(BuildContext context) {

  var titleTextSize;

  MediaQuery.of(context).size.width > 800 
    ? 
  setState(() {
    titleTextSize = 20;
    
  })
  :
  setState(() {
    titleTextSize = 16;
    
  });
    
    


    return Container(
          width: MediaQuery.of(context).size.width > 800
          ? 730
          : MediaQuery.of(context).size.width,
          child: ListView.builder(
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: (){
                      js.context.callMethod("open",[widget.snapshot.data[index].url]);

                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff1a1a1a),
                            borderRadius: BorderRadius.circular(10)),
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width > 800
                                ? 100
                                : MediaQuery.of(context).size.width/7,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            widget.snapshot.data[index].imageUrl),
                                        fit: BoxFit.cover),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width > 800
                                ? 600
                                : MediaQuery.of(context).size.width*0.65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget.snapshot.data[index].title,
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Color(0xffbfbfbf),
                                          fontSize: titleTextSize),
                                    ),
                                    Text(
                                      widget.snapshot.data[index].summary,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Color(0xffbfbfbf), fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              }),
        );
  }
}