import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Practice',
        theme: ThemeData(),
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Color(0xffffffff)),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const Icon(
                Icons.menu,
                color: Color(0xff747474),
                size: 28,
              ),
              centerTitle: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Location",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xffc9c9c9)),
                      )),
                  Text(
                    "Cameron St., Boston",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff545454),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              actions: [
                Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: const CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://i.pravatar.cc/200")))
              ]),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xfff2f2f2),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      ),
    );
  }
}
