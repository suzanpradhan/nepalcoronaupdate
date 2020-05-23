import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nepal_corona_update/api_methods.dart';
import 'package:nepal_corona_update/models/covid_model.dart';
import 'package:nepal_corona_update/models/global_model.dart';
import 'package:nepal_corona_update/models/news_model.dart';
import 'package:nepal_corona_update/responsive_widgets/nepal_summary.dart';
import 'package:nepal_corona_update/responsive_widgets/news_list.dart';
import 'package:nepal_corona_update/responsive_widgets/side_widgets.dart';
import 'package:nepal_corona_update/responsive_widgets/summary_list.dart';

class ResponsiveWeb extends StatefulWidget {
  @override
  _ResponsiveWebState createState() => _ResponsiveWebState();
}

class _ResponsiveWebState extends State<ResponsiveWeb> {
  Future<OverviewModel> overViewData;
  Future<List<NewsModel>> newsData;
  Future<GlobalModel> globalData;
  @override
  void initState() {
    super.initState();
    overViewData = ApiMethods().coronaData();
    newsData = ApiMethods().newsData();
    globalData = ApiMethods().gobalData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FutureBuilder<OverviewModel>(
            future: overViewData,
            builder: (context, snapshot) {
              return snapshot.hasData ?
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Container(
                          width: 1300,
                          height: 320,
                          child: Row(
                            children: <Widget>[
                              Container(
                                  width: 430,
                                  height: 320,
                                  child: Center(
                                      child: SummaryList(snapshot: snapshot))),
                              SizedBox(
                                width: 40,
                              ),
                              Container(
                                  width: 830,
                                  height: 320,
                                  decoration: BoxDecoration(
                                      color: Color(0xff1a1a1a),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: NepalSummary(snapshot: snapshot))
                            ],
                          ))),
                  FutureBuilder<List<NewsModel>>(
                      future: newsData,
                      builder: (context, snapshot) {
                        return snapshot.hasData ?
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                              width: 1300,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NewsList(
                                    snapshot: snapshot,
                                  ),
                                  SizedBox(width:40),
                                  FutureBuilder<GlobalModel>(
                                      future: globalData,
                                      builder: (context, snapshot) {
                                        return snapshot.hasData ?
                                        SideWidgets(snapshot: snapshot)
                                        : Container();
                                      })
                                ],
                              )),
                        )
                        : Container();
                      }),
                ],
              )
              : Container();
            }));
  }
}
