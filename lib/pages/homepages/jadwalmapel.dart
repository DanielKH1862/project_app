import 'package:flutter/material.dart';

class JadwalMapelScreen extends StatelessWidget {
  final List<Map<String, dynamic>> jadwalMapel = [
    {
      'hari': 'Senin',
      'icon': Icons.calendar_today,
      'mapel': [
        {'nama': 'Matematika', 'waktu': '08:00 - 09:30'},
        {'nama': 'Bahasa Indonesia', 'waktu': '09:40 - 11:10'},
        {'nama': 'Fisika', 'waktu': '11:20 - 12:50'},
      ],
    },
    {
      'hari': 'Selasa',
      'icon': Icons.calendar_today,
      'mapel': [
        {'nama': 'Kimia', 'waktu': '08:00 - 09:30'},
        {'nama': 'Bahasa Inggris', 'waktu': '09:40 - 11:10'},
        {'nama': 'Sejarah', 'waktu': '11:20 - 12:50'},
      ],
    },
    // Tambahkan jadwal untuk hari lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Mata Pelajaran'),
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
        child: ListView.builder(
          itemCount: jadwalMapel.length,
          itemBuilder: (context, index) {
            final hari = jadwalMapel[index]['hari'];
            final mapelList = jadwalMapel[index]['mapel'];

            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ExpansionTile(
                leading: Icon(
                  jadwalMapel[index]['icon'],
                  color: Colors.blue,
                ),
                title: Text(
                  hari,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: mapelList.map<Widget>((mapel) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    title: Text(
                      mapel['nama'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(mapel['waktu']),
                    leading: const Icon(
                      Icons.book,
                      color: Colors.blueAccent,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
