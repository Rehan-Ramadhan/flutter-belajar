import 'package:flutter/material.dart';

import '../models/photo.dart';

class PhotoDetailPage extends StatelessWidget {
  final Photo photo;

  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Foto #${photo.id}')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  photo.url ?? '',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 250,
                      child: Center(child: Icon(Icons.broken_image, size: 64)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              Text(
                photo.title ?? 'Tanpa judul',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              Text(
                'ID Foto: ${photo.id}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),

              Text(
                'ID Album: ${photo.albumId}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),

              Text(
                'URL Foto:\n${photo.url}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
