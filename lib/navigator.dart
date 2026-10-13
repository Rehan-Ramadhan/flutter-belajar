import 'package:flutter/material.dart';
import 'package:flutterbelajar/list_grid/list-screenWidget.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ArticleListScreen();
                },
              ),
            );
          },
          child: Text("List Screen"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Kembali"),
        ),
      ],
    );
  }
}
