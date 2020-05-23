import 'package:flutter/material.dart';
import 'package:nepal_corona_update/models/covid_model.dart';
import 'package:nepal_corona_update/models/global_model.dart';
import 'package:nepal_corona_update/models/news_model.dart';
import 'package:nepal_corona_update/responsive_widgets/nepal_summary.dart';
import 'package:nepal_corona_update/responsive_widgets/news_list.dart';
import 'package:nepal_corona_update/responsive_widgets/summary_list.dart';

import '../api_methods.dart';

class MobileResponsive extends StatefulWidget {
  @override
  _MobileResponsiveState createState() => _MobileResponsiveState();
}

class _MobileResponsiveState extends State<MobileResponsive> {
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff1a1a1a),
                    borderRadius: BorderRadius.circular(20)),
                child: FutureBuilder(
                    future: overViewData,
                    builder: (context, snapshot) {
                      return snapshot.hasData ?
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: NepalSummary(snapshot: snapshot),
                      )
                      :Container();
                    })),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<OverviewModel>(
                future: overViewData,
                builder: (context,snapshot){
                  return snapshot.hasData ?
                  SummaryList(snapshot: snapshot)
                  : Container();

                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List<NewsModel>>(
                future: newsData,
                builder: (context,snapshot){
                  return snapshot.hasData ?
                  NewsList(snapshot: snapshot)
                  : Container();

                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
