import 'dart:async';

import 'package:flutter/material.dart';
import '2ndpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),(){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context)=>Imam()
          )
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Center(
            child: Image.asset('Assets/coin.png',
            height: MediaQuery.of(context).size.height*.60,
            width: MediaQuery.of(context).size.width*.60,
    ),
          ),
          Text('HM Imam Hossen')
        ],
      )
    );
  }
}
