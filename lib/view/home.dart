import 'package:flutter/material.dart';
import 'package:khabar_express/controller/fetchNews.dart';
import 'package:khabar_express/model/newsArt.dart';
import 'package:khabar_express/view/widget/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late NewsArt newsArt;

  GetNews() async{
    newsArt= await FetchNews.fetchNews();
    setState(() {
      isLoading=false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
          onPageChanged: (value){

            GetNews();
          },
          itemBuilder: (context,index){
            return isLoading ? Center(child: CircularProgressIndicator(),) : NewsContainer(
                imgUrl: newsArt.imgUrl,
                newsHead: newsArt.newsHead,
                newsDes: newsArt.newsDes,
                newsCnt: newsArt.newsCnt,
                newsUrl: newsArt.newsUrl,
            );
          }),
    );
  }
}
