class GlobalModel{

  final int confirmed;
  final int recovered;
  final int deaths;

  GlobalModel({this.confirmed,this.recovered,this.deaths});

  factory GlobalModel.fromJson(Map<String,dynamic> json){
    return GlobalModel(
      confirmed: json["cases"],
      recovered: json["recovered"],
      deaths: json["deaths"]
    );

  }
}