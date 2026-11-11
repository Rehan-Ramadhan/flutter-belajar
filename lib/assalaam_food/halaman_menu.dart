import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'halaman_pembayaran.dart';

const Color _hijauUtama = Color(0xFF006837);
const Color _hijauMuda = Color(0xFF10B981);
const Color _kuning = Color(0xFFFBBF24);
const Color _latar = Color(0xFFF9FAFB);
const Color _teksUtama = Color(0xFF1F2937);
const Color _teksSekunder = Color(0xFF4B5563);
const Color _garis = Color(0xFFE5E7EB);

final NumberFormat _rupiah = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp ',
  decimalDigits: 0,
);

class HalamanMenu extends StatefulWidget {
  const HalamanMenu({super.key});

  @override
  State<HalamanMenu> createState() => _HalamanMenuState();
}

class _HalamanMenuState extends State<HalamanMenu> {
  
List<Map<String, dynamic>> menu = [
  {
    'nama': 'Nasi Goreng',
    'jenis': 'Makanan',
    'harga': 12000,
    'gambar': 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=500&h=500&q=80',
    'jumlah': 0,
  },
  {
    'nama': 'Mie Ayam',
    'jenis': 'Makanan',
    'harga': 10000,
    'gambar': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=500&h=500&q=80',
    'jumlah': 0,
  },
  {
    'nama': 'Ayam Geprek',
    'jenis': 'Makanan',
    'harga': 13000,
    'gambar': 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=500&h=500&q=80',
    'jumlah': 0,
  },
  {
    'nama': 'Batagor',
    'jenis': 'Makanan',
    'harga': 8000,
    'gambar': 'https://imgx.sonora.id/crop/0x0:0x0/x/photo/2023/09/07/64f7fe0a00572jpg-20230907064356.jpg',
    'jumlah': 0,
  },
  {
    'nama': 'Es Teh Manis',
    'jenis': 'Minuman',
    'harga': 4000,
    'gambar': 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=500&h=500&q=80',
    'jumlah': 0,
  },
  {
    'nama': 'Jus Jeruk',
    'jenis': 'Minuman',
    'harga': 7000,
    'gambar': 'https://images.unsplash.com/photo-1613478223719-2ab802602423?auto=format&fit=crop&w=500&h=500&q=80',
    'jumlah': 0,
  },
  {
    'nama': 'Es Coklat',
    'jenis': 'Minuman',
    'harga': 8000,
    'gambar': 'https://images.unsplash.com/photo-1544787219-7f47ccb76574?auto=format&fit=crop&w=500&h=500&q=80',
    'jumlah': 0,
  },
  {
    'nama': 'Air Mineral',
    'jenis': 'Minuman',
    'harga': 3000,
    'gambar': 'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=500&h=500&q=80',
    'jumlah': 0,
  },
];

  void tambah(Map<String, dynamic> item) {
    setState(() {
      item['jumlah'] = item['jumlah'] + 1;
    });
  }

  void kurang(Map<String, dynamic> item) {
    setState(() {
      item['jumlah'] = item['jumlah'] - 1;
    });
  }

  int hitungJumlahItem() {
    int hasil = 0;
    for (var item in menu) {
      hasil = hasil + (item['jumlah'] as int);
    }
    return hasil;
  }

  int hitungTotal() {
    int hasil = 0;
    for (var item in menu) {
      hasil = hasil + (item['harga'] as int) * (item['jumlah'] as int);
    }
    return hasil;
  }

  void lihatPesanan() {
    List<Map<String, dynamic>> terpilih = [];
    for (var item in menu) {
      if (item['jumlah'] > 0) {
        terpilih.add(item);
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HalamanPembayaran(pesanan: terpilih),
      ),
    ).then((selesai) {
      setState(() {
        if (selesai == true) {
          for (var item in menu) {
            item['jumlah'] = 0;
          }
        }
      });
    });
  }

  Widget tombolAksi(Map<String, dynamic> item) {
    int jumlah = item['jumlah'];

    if (jumlah == 0) {
      return ElevatedButton(
        onPressed: () {
          tambah(item);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _hijauMuda,
          foregroundColor: Colors.white,
          minimumSize: const Size(44, 44),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Icon(Icons.add),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            kurang(item);
          },
          icon: const Icon(Icons.remove_circle_outline, color: _hijauUtama),
        ),
        Text(
          '$jumlah',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _teksUtama,
          ),
        ),
        IconButton(
          onPressed: () {
            tambah(item);
          },
          icon: const Icon(Icons.add_circle, color: _hijauMuda),
        ),
      ],
    );
  }

  Widget kartuMenu(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _garis),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item['gambar'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: _garis,
                  child: const Icon(Icons.restaurant, color: _teksSekunder),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['nama'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _teksUtama,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item['jenis'],
                  style: const TextStyle(fontSize: 13, color: _teksSekunder),
                ),
                const SizedBox(height: 6),
                Text(
                  _rupiah.format(item['harga']),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: _hijauUtama,
                  ),
                ),
              ],
            ),
          ),
          tombolAksi(item),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int jumlahItem = hitungJumlahItem();
    int total = hitungTotal();

    return Scaffold(
      backgroundColor: _latar,
      appBar: AppBar(
        backgroundColor: _hijauUtama,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Assalaam Food',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: jumlahItem > 0 ? lihatPesanan : null,
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 28,
                ),
                if (jumlahItem > 0)
                  Positioned(
                    right: -8,
                    top: -8,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: _kuning,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$jumlahItem',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: _teksUtama,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
            decoration: const BoxDecoration(
              color: _hijauUtama,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mau jajan apa hari ini?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Pilih menu kantin favoritmu',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return kartuMenu(menu[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: _garis)),
        ),
        child: SafeArea(
          top: false,
          child: ElevatedButton(
            onPressed: jumlahItem > 0 ? lihatPesanan : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: _hijauUtama,
              foregroundColor: Colors.white,
              disabledBackgroundColor: _garis,
              disabledForegroundColor: _teksSekunder,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              jumlahItem > 0
                  ? 'Lihat Pesanan ($jumlahItem item) - ${_rupiah.format(total)}'
                  : 'Pilih menu dulu',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
