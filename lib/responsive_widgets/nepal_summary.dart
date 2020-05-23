import 'package:flutter/material.dart';
import 'package:nepal_corona_update/models/covid_model.dart';

class NepalSummary extends StatefulWidget {

  final AsyncSnapshot<OverviewModel> snapshot;

  NepalSummary({this.snapshot});
  @override
  _NepalSummaryState createState() => _NepalSummaryState();
}

class _NepalSummaryState extends State<NepalSummary> {

  @override
  Widget build(BuildContext context) {

    var titleSize;
    var circleWidth;
    var summaryTitleSize;

    MediaQuery.of(context).size.width > 800 
    ? 
  setState(() {
    titleSize = 20;
    circleWidth = 5;
    summaryTitleSize = 30;
    
  })
  :
  setState(() {
    titleSize = 16;
    circleWidth = 3;
    summaryTitleSize = 26;
    
  });
    

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width > 500
                ? 160
                : MediaQuery.of(context).size.width/4,
                height: MediaQuery.of(context).size.width > 500 
                ? 160
                : MediaQuery.of(context).size.width/4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(width: circleWidth, color: Color(0xffff0000))),
                child: Center(
                    child: Text(widget.snapshot.data.confirmed.toString(),
                        style: TextStyle(
                            fontFamily: "Bebas",
                            fontSize: summaryTitleSize,
                            color: Colors.white)))),
            SizedBox(height: 20),
            Center(
                child: Text("Confirmed",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: titleSize,
                        color: Color(0xffbfbfbf))))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width > 800 
                ? 160
                : MediaQuery.of(context).size.width/4,
                height: MediaQuery.of(context).size.width > 800 
                ? 160
                : MediaQuery.of(context).size.width/4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(width: circleWidth, color: Color(0xff00de4e))),
                child: Center(
                    child: Text(widget.snapshot.data.recovered.toString(),
                        style: TextStyle(
                            fontFamily: "Bebas",
                            fontSize: summaryTitleSize,
                            color: Colors.white)))),
            SizedBox(height: 20),
            Center(
                child: Text("Recovered",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: titleSize,
                        color: Color(0xffbfbfbf))))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width > 800 
                ? 160
                : MediaQuery.of(context).size.width/4,
                height: MediaQuery.of(context).size.width > 800 
                ? 160
                : MediaQuery.of(context).size.width/4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(width: circleWidth, color: Color(0xfff2e205))),
                child: Center(
                    child: Text(widget.snapshot.data.deaths.toString(),
                        style: TextStyle(
                            fontFamily: "Bebas",
                            fontSize: summaryTitleSize,
                            color: Colors.white)))),
            SizedBox(height: 20),
            Center(
                child: Text("Deaths",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: titleSize,
                        color: Color(0xffbfbfbf))))
          ],
        )
      ],
    );
  }
}