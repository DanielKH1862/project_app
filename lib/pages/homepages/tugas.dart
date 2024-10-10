import 'package:flutter/material.dart';

class TugasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tugasList = [
    {
      'judul': 'Tugas Matematika Bab 1',
      'mataPelajaran': 'Matematika',
      'deadline': '25 September 2024',
      'status': false,
    },
    {
      'judul': 'Essay Sejarah Kemerdekaan',
      'mataPelajaran': 'Sejarah',
      'deadline': '28 September 2024',
      'status': true,
    },
    {
      'judul': 'Praktikum Fisika Gelombang',
      'mataPelajaran': 'Fisika',
      'deadline': '30 September 2024',
      'status': false,
    },
    {
      'judul': 'Laporan Kimia Organik',
      'mataPelajaran': 'Kimia',
      'deadline': '2 Oktober 2024',
      'status': true,
    },
    // Tambahkan lebih banyak data tugas sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas'),
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
          itemCount: tugasList.length,
          itemBuilder: (context, index) {
            final tugas = tugasList[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  tugas['judul'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Mata Pelajaran: ${tugas['mataPelajaran']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          'Deadline: ${tugas['deadline']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.check_circle_outline, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          tugas['status']
                              ? 'Status: Selesai'
                              : 'Status: Belum Selesai',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                tugas['status'] ? Colors.green : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'selesai') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Tugas "${tugas['judul']}" ditandai sebagai selesai'),
                        ),
                      );
                    } else if (value == 'detail') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Melihat detail tugas "${tugas['judul']}"'),
                        ),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'selesai',
                        child: Text('Tandai sebagai Selesai'),
                      ),
                      const PopupMenuItem(
                        value: 'detail',
                        child: Text('Lihat Detail'),
                      ),
                    ];
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
