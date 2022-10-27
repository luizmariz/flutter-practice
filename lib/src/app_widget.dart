import 'package:flutter/material.dart';
import 'package:flutter_practice/src/screens/home/home_widget.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Practice',
        theme: ThemeData(),
        home: HomeWidget(),
        debugShowCheckedModeBanner: false);
  }
}
