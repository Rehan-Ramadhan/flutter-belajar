import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color _hijauUtama = Color(0xFF006837);
const Color _hijauMuda = Color(0xFF10B981);
const Color _latar = Color(0xFFF9FAFB);
const Color _teksUtama = Color(0xFF1F2937);
const Color _teksSekunder = Color(0xFF4B5563);
const Color _garis = Color(0xFFE5E7EB);

final NumberFormat _rupiah = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp ',
  decimalDigits: 0,
);

class HalamanStruk extends StatelessWidget {
  final List<Map<String, dynamic>> pesanan;
  final int total;
  final String metode;
  final int uangDibayar;
  final int kembalian;
  final String tanggal;

  const HalamanStruk({
    super.key,
    required this.pesanan,
    required this.total,
    required this.metode,
    required this.uangDibayar,
    required this.kembalian,
    required this.tanggal,
  });

  Widget baris(String kiri, String kanan, {bool tebal = false}) {
    TextStyle gaya = TextStyle(
      fontWeight: tebal ? FontWeight.bold : FontWeight.normal,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(kiri, style: gaya),
          Text(kanan, style: gaya),
        ],
      ),
    );
  }

  Widget garisPutus() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        '- ' * 40,
        maxLines: 1,
        softWrap: false,
        overflow: TextOverflow.clip,
        style: const TextStyle(color: _teksSekunder),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _latar,
      appBar: AppBar(
        backgroundColor: _hijauUtama,
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Struk Pembayaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.check_circle, color: _hijauMuda, size: 56),
            const SizedBox(height: 8),
            const Text(
              'Pembayaran Berhasil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _teksUtama,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _garis),
              ),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                  color: _teksUtama,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'ASSALAAM FOOD',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _hijauUtama,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Kantin Sekolah Assalaam',
                        style: TextStyle(fontSize: 12, color: _teksSekunder),
                      ),
                    ),
                    garisPutus(),
                    baris('Tanggal', tanggal),
                    garisPutus(),

                    for (var item in pesanan)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['nama'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            baris(
                              '${item['jumlah']} x ${_rupiah.format(item['harga'])}',
                              _rupiah.format(item['harga'] * item['jumlah']),
                            ),
                          ],
                        ),
                      ),

                    garisPutus(),
                    baris('TOTAL', _rupiah.format(total), tebal: true),
                    baris('Metode', metode),
                    if (metode == 'Cash') ...[
                      baris('Uang dibayar', _rupiah.format(uangDibayar)),
                      baris('Kembalian', _rupiah.format(kembalian)),
                    ],
                    garisPutus(),
                    const Center(
                      child: Text(
                        'Terima kasih sudah jajan!',
                        style: TextStyle(color: _teksSekunder),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _hijauUtama,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kembali ke Menu',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
