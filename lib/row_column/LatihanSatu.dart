import 'package:flutter/material.dart';

class LatihanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 300,
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://fahmiad.com/wp-content/uploads/2022/01/foto-profil-wa-sad-boy4.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Text("Nama: Rehan Ramadhan"),
                Text("Kelas: XII RPL 1"),
                Text("NIS: 666"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
