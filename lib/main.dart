import 'package:flutter/material.dart';
import 'package:khabar_express/view/home.dart';
import 'package:khabar_express/view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool showingSplash =true;
  LoadHome(){
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        showingSplash=false;
      });
    });
  }
  @override
  void initState(){
    super.initState();
    LoadHome();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khabar Express ',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: showingSplash ? SplashScreen() : HomeScreen(),
    );
  }
}


