import 'package:flutter/material.dart';

class LatihanTiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              height: 75,
              alignment: Alignment.center,
              child: Text("Pemasukan +"),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              height: 75,
              alignment: Alignment.center,
              child: Text("Pengeluaran -"),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              height: 75,
              alignment: Alignment.center,
              child: Text("Saldo ="),
            ),
          ),
        ],
      ),
    );
  }
}
