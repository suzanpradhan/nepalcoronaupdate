import 'package:flutter/material.dart';
import 'package:nepal_corona_update/models/global_model.dart';

class SideWidgets extends StatefulWidget {
  final AsyncSnapshot<GlobalModel> snapshot;
  SideWidgets({this.snapshot});


  @override
  _SideWidgetsState createState() => _SideWidgetsState();
}

class _SideWidgetsState extends State<SideWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 530,
      child: Column(
            children: [
              Container(
                width: 530,
                height:60,
                decoration: BoxDecoration(
                  color: Color(0xff1a1a1a),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text("Global",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xffbfbfbf),
                        fontSize: 28
                      )),
                    ],
                  ),
                )
              ),
              SizedBox(
                height:20
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Color(0xff1a1a1a),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 530,
                child: globalSummary(widget.snapshot))
            ],
          ),
    );
  }

  Widget globalSummary(AsyncSnapshot<GlobalModel> snapshot) {
    List baseTitles = ["Confirmed", "Recovered", "Deaths"];
    List globalSummary = [
      snapshot.data.confirmed.toString(),
      snapshot.data.recovered.toString(),
      snapshot.data.deaths.toString()
    ];
    List colorHigh = [Color(0xffFBFF87), Color(0xffC2FFDC), Color(0xffF08E93)];
    List colorBase = [Color(0xffFFDF00), Color(0xff9BCCB0), Color(0xffFA4850)];
    return ListView.builder(
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        itemCount: globalSummary.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  width: 410,
                  height: 100,
                  decoration: BoxDecoration(
                      color: colorHigh[index],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Center(
                      child: Text(
                    globalSummary[index],
                    style: TextStyle(
                        fontFamily: "Bebas",
                        fontSize: 32,
                        color: Color(0xff0d0d0d)),
                  )),
                ),
                Container(
                  width: 410,
                  height: 50,
                  decoration: BoxDecoration(
                      color: colorBase[index],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Center(
                      child: Text(baseTitles[index],
                          style: TextStyle(fontSize: 18))),
                ),
              ],
            ),
          );
        });
  }
}