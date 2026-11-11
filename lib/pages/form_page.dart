import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  DateTime? _selectedBirthDate;
  String? _gender;
  String? _religion;

  String _outputName = '';
  String _outputBirthDate = '';
  String _outputGender = '';
  String _outputAddress = '';
  String _outputReligion = '';

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _selectBirthDate() async {
    final DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedBirthDate ?? now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        _selectedBirthDate = picked;

        final String day = picked.day.toString().padLeft(2, '0');
        final String month = picked.month.toString().padLeft(2, '0');
        final String year = picked.year.toString();

        _birthDateController.text = '$day-$month-$year';
      });
    }
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_gender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih jenis kelamin terlebih dahulu')),
      );
      return;
    }

    setState(() {
      _outputName = _nameController.text;
      _outputBirthDate = _birthDateController.text;
      _outputGender = _gender!;
      _outputAddress = _addressController.text;
      _outputReligion = _religion!;
    });

    print('Nama: $_outputName');
    print('Tanggal lahir: $_outputBirthDate');
    print('Jenis kelamin: $_outputGender');
    print('Alamat: $_outputAddress');
    print('Agama: $_outputReligion');

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Data berhasil disimpan')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Masukkan nama Anda',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Tanggal lahir
              TextFormField(
                controller: _birthDateController,
                readOnly: true,
                onTap: _selectBirthDate,
                decoration: const InputDecoration(
                  labelText: 'Tanggal lahir',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_month),
                ),
                validator: (value) {
                  if (_selectedBirthDate == null) {
                    return 'Tanggal lahir wajib dipilih';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Jenis kelamin
              const Text('Jenis kelamin', style: TextStyle(fontSize: 16)),

              RadioListTile<String>(
                title: const Text('Laki-laki'),
                value: 'Laki-laki',
                groupValue: _gender,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text('Perempuan'),
                value: 'Perempuan',
                groupValue: _gender,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Alamat
              TextFormField(
                controller: _addressController,
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Masukkan alamat lengkap',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Agama
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Agama',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Pilih agama'),
                items: const [
                  DropdownMenuItem(value: 'Islam', child: Text('Islam')),
                  DropdownMenuItem(value: 'Kristen', child: Text('Kristen')),
                  DropdownMenuItem(value: 'Katolik', child: Text('Katolik')),
                  DropdownMenuItem(value: 'Hindu', child: Text('Hindu')),
                  DropdownMenuItem(value: 'Buddha', child: Text('Buddha')),
                  DropdownMenuItem(value: 'Konghucu', child: Text('Konghucu')),
                ],
                onChanged: (value) {
                  setState(() {
                    _religion = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Agama wajib dipilih';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // Tombol simpan
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Simpan'),
              ),

              const SizedBox(height: 16),

              // Output hanya berubah setelah tombol Simpan ditekan
              Text(
                'Nama: ${_outputName.isEmpty ? "-" : _outputName}\n'
                'Tanggal lahir: ${_outputBirthDate.isEmpty ? "-" : _outputBirthDate}\n'
                'Jenis kelamin: ${_outputGender.isEmpty ? "-" : _outputGender}\n'
                'Alamat: ${_outputAddress.isEmpty ? "-" : _outputAddress}\n'
                'Agama: ${_outputReligion.isEmpty ? "-" : _outputReligion}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
