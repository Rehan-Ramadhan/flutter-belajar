import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(height: 140, color: Colors.amber),
            Positioned(
              bottom: -30,
              left: 20,
              child: SizedBox(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1682685790910-1e3f8c5b6d2e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Rehan Ramadhan"), Text("XII RPL 1")],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Follow")),
      ],
    );
  }
}
