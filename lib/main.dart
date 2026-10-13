import 'package:flutter/material.dart';
import 'package:flutterbelajar/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRoutes.routes,
      // home: Scaffold(
      //   // appBar: AppBar(
      //   //   title: Text("Flutter App"),
      //   //   backgroundColor: Colors.amber,
      //   //   centerTitle: true,
      //   // ),
      //   body: ArticleListScreen(),
      // ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello Flutter",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
