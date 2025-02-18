import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
class DetailViewScreen extends StatefulWidget {
  String newsUrl;
  DetailViewScreen({super.key, required this.newsUrl});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {


  void initState(){
    super.initState();
    setState(() {
      widget.newsUrl=widget.newsUrl.contains("http:") ? widget.newsUrl.replaceAll("http:", "https:") : widget.newsUrl;
    });
  }
  final Completer<WebViewController> controller= Completer<WebViewController>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: widget.newsUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          setState((){
            controller.complete(webViewController);
          });
        },
      ),
    );
  }
}

