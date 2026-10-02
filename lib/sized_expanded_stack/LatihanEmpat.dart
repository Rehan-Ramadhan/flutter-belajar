import 'package:flutter/material.dart';

class LatihanEmpat extends StatelessWidget {
  const LatihanEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 75,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle, color: Colors.white, size: 40),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rehan Ramadhan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'XII RPL 1',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.notifications, color: Colors.white, size: 15),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 180,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Latihan 4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.school,
                      color: const Color.fromARGB(255, 140, 167, 248),
                      size: 28,
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Text(
                  'Belajar Flutter!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Belajar dimulai dari fundamental',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xff12217f),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Mulai Belajar'),
                      SizedBox(width: 8),
                      Icon(Icons.north_east, size: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
