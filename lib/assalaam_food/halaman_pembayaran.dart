import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'halaman_struk.dart';

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

class HalamanPembayaran extends StatefulWidget {
  final List<Map<String, dynamic>> pesanan;

  const HalamanPembayaran({super.key, required this.pesanan});

  @override
  State<HalamanPembayaran> createState() => _HalamanPembayaranState();
}

class _HalamanPembayaranState extends State<HalamanPembayaran> {
  String metode = 'Cash';

  final TextEditingController namaController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  final TextEditingController uangController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    kelasController.dispose();
    uangController.dispose();
    super.dispose();
  }

  int hitungTotal() {
    int hasil = 0;

    for (var item in widget.pesanan) {
      hasil = hasil + (item['harga'] as int) * (item['jumlah'] as int);
    }

    return hasil;
  }

  void tambah(Map<String, dynamic> item) {
    setState(() {
      item['jumlah'] = item['jumlah'] + 1;
    });
  }

  void kurang(Map<String, dynamic> item) {
    setState(() {
      item['jumlah'] = item['jumlah'] - 1;

      if (item['jumlah'] == 0) {
        widget.pesanan.remove(item);
      }
    });
  }

  void bayar() {
    int total = hitungTotal();
    int uang = int.tryParse(uangController.text) ?? 0;
    int kembalian = 0;

    if (metode == 'Cash') {
      kembalian = uang - total;
    } else {
      uang = total;
    }

    String tanggal = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HalamanStruk(
          pesanan: widget.pesanan,
          total: total,
          metode: metode,
          uangDibayar: uang,
          kembalian: kembalian,
          tanggal: tanggal,
          nama: namaController.text.trim(),
          kelas: kelasController.text.trim(),
        ),
      ),
    );
  }

  Widget kartuPesanan(Map<String, dynamic> item) {
    int harga = item['harga'];
    int jumlah = item['jumlah'];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _garis),
      ),
      child: Row(
        children: [
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
                  _rupiah.format(harga),
                  style: const TextStyle(fontSize: 13, color: _teksSekunder),
                ),
                const SizedBox(height: 6),
                Text(
                  'Subtotal: ${_rupiah.format(harga * jumlah)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _hijauUtama,
                  ),
                ),
              ],
            ),
          ),
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
      ),
    );
  }

  Widget bagianIdentitas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Pemesan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _teksUtama,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: namaController,
          textCapitalization: TextCapitalization.words,
          onChanged: (nilai) {
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'Nama Lengkap',
            hintText: 'Masukkan nama kamu',
            prefixIcon: const Icon(Icons.person_outline),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: kelasController,
          textCapitalization: TextCapitalization.characters,
          onChanged: (nilai) {
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'Kelas',
            hintText: 'Contoh: XII RPL 1',
            prefixIcon: const Icon(Icons.school_outlined),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }

  Widget bagianCash(int total, int uang) {
    String? pesanError;

    if (uangController.text.isNotEmpty && uang < total) {
      pesanError =
          'Uang kurang ${_rupiah.format(total - uang)} dari total pesanan';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: uangController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (nilai) {
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'Uang yang dibayarkan',
            prefixText: 'Rp ',
            helperText: 'Masukkan nominal, contoh: 20000',
            errorText: pesanError,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 12),
        if (uangController.text.isNotEmpty && uang >= total)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _hijauMuda),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kembalian',
                  style: TextStyle(fontSize: 15, color: _teksUtama),
                ),
                Text(
                  _rupiah.format(uang - total),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _hijauUtama,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget bagianQris(int total) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _garis),
      ),
      child: Column(
        children: [
          const Text(
            'Scan QRIS untuk membayar',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _teksUtama,
            ),
          ),
          const SizedBox(height: 12),
          const Icon(Icons.qr_code_2, size: 200, color: _teksUtama),
          const SizedBox(height: 8),
          Text(
            _rupiah.format(total),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _hijauUtama,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'QRIS simulasi, bukan pembayaran sungguhan',
            style: TextStyle(fontSize: 12, color: _teksSekunder),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int total = hitungTotal();
    int uang = int.tryParse(uangController.text) ?? 0;

    bool identitasLengkap =
        namaController.text.trim().isNotEmpty &&
        kelasController.text.trim().isNotEmpty;

    bool bisaBayar =
        widget.pesanan.isNotEmpty &&
        identitasLengkap &&
        (metode == 'QRIS' || uang >= total);

    return Scaffold(
      backgroundColor: _latar,
      appBar: AppBar(
        backgroundColor: _hijauUtama,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bagianIdentitas(),
            const SizedBox(height: 24),

            const Text(
              'Pesanan Kamu',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _teksUtama,
              ),
            ),
            const SizedBox(height: 12),

            if (widget.pesanan.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text(
                    'Belum ada pesanan. Kembali ke menu untuk memilih.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: _teksSekunder),
                  ),
                ),
              ),

            for (var item in widget.pesanan) kartuPesanan(item),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _hijauUtama,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    _rupiah.format(total),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: _kuning,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Metode Pembayaran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _teksUtama,
              ),
            ),
            const SizedBox(height: 8),

            RadioGroup<String>(
              groupValue: metode,
              onChanged: (nilai) {
                setState(() {
                  metode = nilai!;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _garis),
                ),
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      value: 'Cash',
                      activeColor: _hijauUtama,
                      title: Text('Cash'),
                    ),
                    RadioListTile<String>(
                      value: 'QRIS',
                      activeColor: _hijauUtama,
                      title: Text('QRIS'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            if (metode == 'Cash') bagianCash(total, uang),
            if (metode == 'QRIS') bagianQris(total),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: bisaBayar ? bayar : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _hijauUtama,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: _garis,
                  disabledForegroundColor: _teksSekunder,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  metode == 'Cash'
                      ? 'Bayar Sekarang'
                      : 'Konfirmasi Pembayaran (Simulasi)',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
