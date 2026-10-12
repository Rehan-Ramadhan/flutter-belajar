import 'package:flutter/material.dart';
import 'package:flutterbelajar/list_grid/detailScreenWidget.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Flutter Dasar',
      'description': 'Pelajari dasar-dasar Flutter dalam kursus ini.',
      'image': 'https://picsum.photos/200?1',
    },
    {
      'name': 'State Management',
      'description': 'Pahami berbagai teknik untuk mengelola state dalam aplikasi Flutter.',
      'image': 'https://picsum.photos/200?2',
    },
    {
      'name': 'Flutter Dasar',
      'description': 'Pelajari dasar-dasar Flutter dalam kursus ini.',
      'image': 'https://picsum.photos/200?3',
    },
    {
      'name': 'State Management',
      'description': 'Pahami berbagai teknik untuk mengelola state dalam aplikasi Flutter.',
      'image': 'https://picsum.photos/200?4',
    },
    {
      'name': 'Flutter Dasar',
      'description': 'Pelajari dasar-dasar Flutter dalam kursus ini.',
      'image': 'https://picsum.photos/200?3',
    },
    {
      'name': 'State Management',
      'description': 'Pahami berbagai teknik untuk mengelola state dalam aplikasi Flutter.',
      'image': 'https://picsum.photos/200?4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ArticleDetailScreen(data: product),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(product['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          product['description']!,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
