class NewsArt{
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsArt({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,
    required this.newsCnt
});
  static NewsArt fromAPItoApp(Map<String,dynamic> article){
    return NewsArt(
        imgUrl: article["urlToImage"] ?? "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg",
        newsHead: article["title"],
        newsDes: article["description"],
        newsUrl: article["url"],
        newsCnt: article["content"] ?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en"
    );
  }
}
