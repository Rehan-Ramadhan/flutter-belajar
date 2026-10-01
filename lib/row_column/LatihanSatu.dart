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
              child: Image.network(
                "https://www.shutterstock.com/editorial/image-editorial/NdTdg54eM6TdgcwbNTAyMg==/avenged-sevenfold---m-shadows-matthew-sanders-440nw-5841906h.jpg",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Text(
                    "Gambar gagal dimuat",
                    textAlign: TextAlign.center,
                  );
                },
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
