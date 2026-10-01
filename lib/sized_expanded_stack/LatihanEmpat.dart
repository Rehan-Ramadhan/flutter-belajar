import 'package:flutter/material.dart';

class LatihanEmpat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          color: Colors.blue,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  "https://www.shutterstock.com/editorial/image-editorial/NdTdg54eM6TdgcwbNTAyMg==/avenged-sevenfold---m-shadows-matthew-sanders-440nw-5841906h.jpg",
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rehan Ramadhan",
                  ),
                  Text(
                    "XII RPL 1",
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.notifications),
            ],
          ),
        ),
        
      ],
    );
  }
}
