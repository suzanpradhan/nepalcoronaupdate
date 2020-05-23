class NewsModel{

  final String title;
  final String url;
  final String summary;
  final String imageUrl;

  NewsModel({this.title,this.url,this.summary,this.imageUrl});

  factory NewsModel.fromJson(Map <String,dynamic> json){
    return NewsModel(
      title: json["title"],
      url: json["url"],
      summary: json["summary"],
      imageUrl: json["image_url"]
    );

  }
}