import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:nepal_corona_update/models/global_model.dart';
import 'package:nepal_corona_update/models/news_model.dart';
import 'dart:convert';

import 'models/covid_model.dart';
class ApiMethods{


  Future<OverviewModel> coronaData() async{
    final response = await http.get("https://nepalcorona.info/api/v1/data/nepal");
    
    if (response.statusCode == 200) {
    return OverviewModel.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  }

  Future<List<NewsModel>> newsData() async{
    final response = await http.get("https://nepalcorona.info/api/v1/news");

    if (response.statusCode == 200){
      Iterable list = json.decode(response.body)["data"];
      List<NewsModel> newsList = list.map((model) => NewsModel.fromJson(model)).toList();
      return newsList;
    } else{
      throw Exception("Failed!");
    }

  }

    Future<GlobalModel> gobalData() async{
    final response = await http.get("https://data.nepalcorona.info/api/v1/world");
    
    if (response.statusCode == 200) {
    return GlobalModel.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  }
}