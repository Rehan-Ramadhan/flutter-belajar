import 'package:flutter/material.dart';

class Expandedwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 50, color: Colors.tealAccent),
        Expanded(
          flex: 1,
          child: Container(height: 50, color: Colors.lightBlueAccent),
        ),
        Expanded(flex: 2, child: Container(height: 50, color: Colors.red)),
        Expanded(child: Container(height: 50, color: Colors.blue)),
      ],
    );
  }
}
