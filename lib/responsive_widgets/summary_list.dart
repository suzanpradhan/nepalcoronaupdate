import 'package:flutter/material.dart';
import 'package:nepal_corona_update/models/covid_model.dart';

class SummaryList extends StatefulWidget {

  final AsyncSnapshot<OverviewModel> snapshot;
  SummaryList({this.snapshot});

  @override
  _SummaryListState createState() => _SummaryListState();
}

class _SummaryListState extends State<SummaryList> {


  List titles = [
      "Positive Tested",
      "Negative Tested",
      "Total Tested",
      "In Isolation",
      "Quarantined",
      "RDT Tested"
    ];

    
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: titles.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xff1a1a1a),
                    borderRadius: BorderRadius.circular(8)),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      titles[index],
                      style: TextStyle(
                          color: Color(0xffbfbfbf),
                          fontFamily: "Poppins",
                          fontSize: 16),
                    ),
                    Text(
                      widget.snapshot.data.summaryList[index].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    )
                  ],
                )),
          );
        });
  }
}