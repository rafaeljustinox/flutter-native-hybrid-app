import 'package:flutter/material.dart';
import 'package:statusbarz/statusbarz.dart';
import 'pages/about_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusbarzCapturer(
      child: MaterialApp(
        title: 'Flutter POC App',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [Statusbarz.instance.observer],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AboutPage(),
      ),
    );
  }
}
