import 'package:flutter/material.dart';
import 'package:khabar_express/view/detail_view.dart';
class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;
  NewsContainer({super.key,

    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,
    required this.newsCnt
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              height: 400,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: "assets/img/logo.jpg",
              image: imgUrl),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 25,),
            Text(newsHead, style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            SizedBox(height: 13),
            Text(newsDes, style: TextStyle(fontSize: 18,color: Colors.black38)),
            SizedBox(height: 13),
            Text(
                newsCnt.length >150 ? "${newsCnt.substring(0,130)}...":"${newsCnt.toString().substring(0,newsCnt.length-15)}...",
                style: TextStyle(fontSize: 15,)
            ),
          ],),
        ),

        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailViewScreen(newsUrl: newsUrl)));
              }, child: Text("Read More")),
            ),
          ],
        ),
          SizedBox(height: 20,)
      ],),
    );
  }
}
