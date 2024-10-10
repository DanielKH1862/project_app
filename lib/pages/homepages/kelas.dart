import 'package:flutter/material.dart';

class KelasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> kelasList = [
    {
      'nama': 'Kelas 10 IPA',
      'deskripsi': 'Kelas untuk siswa IPA tingkat 10',
      'icon': Icons.science,
      'color': Colors.green,
    },
    {
      'nama': 'Kelas 10 IPS',
      'deskripsi': 'Kelas untuk siswa IPS tingkat 10',
      'icon': Icons.public,
      'color': Colors.orange,
    },
    {
      'nama': 'Kelas 11 IPA',
      'deskripsi': 'Kelas untuk siswa IPA tingkat 11',
      'icon': Icons.science,
      'color': Colors.blue,
    },
    {
      'nama': 'Kelas 11 IPS',
      'deskripsi': 'Kelas untuk siswa IPS tingkat 11',
      'icon': Icons.public,
      'color': Colors.red,
    },
    // Tambahkan lebih banyak kelas jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kelas'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: kelasList.length,
          itemBuilder: (context, index) {
            final kelas = kelasList[index];

            return GestureDetector(
              onTap: () {
                // Tambahkan aksi ketika kelas di-tap, misalnya navigasi ke halaman detail kelas
                print('${kelas['nama']} dipilih');
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [kelas['color'].withOpacity(0.7), kelas['color']],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        kelas['icon'],
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        kelas['nama'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        kelas['deskripsi'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
