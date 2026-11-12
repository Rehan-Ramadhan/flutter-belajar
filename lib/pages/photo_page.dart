import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../services/api_service.dart';
import 'photo_detail_page.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final PhotoApiService _api = PhotoApiService();
  late Future<List<Photo>> _futurePhotos;

  @override
  void initState() {
    super.initState();
    _futurePhotos = _api.fetchPhotos();
  }

  void _reload() {
    setState(() {
      _futurePhotos = _api.fetchPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Foto'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _reload),
        ],
      ),
      body: FutureBuilder<List<Photo>>(
        future: _futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      'Terjadi kesalahan:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _reload,
                      child: const Text('Coba lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final photos = snapshot.data!;

          if (photos.isEmpty) {
            return const Center(child: Text('Belum ada data'));
          }

          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, i) {
              final photo = photos[i];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      photo.thumbnailUrl ?? '',
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.broken_image),
                        );
                      },
                    ),
                  ),
                  title: Text(
                    photo.title ?? 'Tanpa judul',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text('Foto ID: ${photo.id}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhotoDetailPage(photo: photo),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
