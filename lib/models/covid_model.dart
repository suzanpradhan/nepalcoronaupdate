class OverviewModel{

  final int confirmed;
  final int recovered;
  final int deaths;
  final List summaryList;
  



  OverviewModel({this.confirmed,this.deaths,this.recovered,
  this.summaryList});

  factory OverviewModel.fromJson(Map <String,dynamic> json){
    return OverviewModel(
      confirmed: json["tested_positive"],
      recovered: json["recovered"],
      deaths: json["deaths"],
      summaryList: [
        json["tested_positive"],
        json["tested_negative"],
        json["tested_total"],
        json["in_isolation"],
        json["quarantined"],
        json["tested_rdt"]
      ]
    );
  }
}