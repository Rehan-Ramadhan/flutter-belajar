// import 'package:flutter/material.dart';
// import 'package:flutterbelajar/routes/app_routes.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: AppRoutes.routes,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'pages/photo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch API Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const PhotoPage(),
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
