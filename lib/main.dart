import 'package:flutter/material.dart';
import 'package:flutterbelajar/list_grid/detailScreenWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Flutter App"),
        //   backgroundColor: Colors.amber,
        //   centerTitle: true,
        // ),
        body: ArticleDetailScreen(data: {
          'image': 'https://via.placeholder.com/300',
          'description': 'detailScreenWidget',
        }),
      ),
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
