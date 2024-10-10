import 'package:flutter/material.dart';

class PerpustakaanScreen extends StatelessWidget {
  final List<Map<String, String>> bukuList = [
    {
      'judul': 'Pendidikan Pancasila',
      'penulis': 'Dr. Ahmad Zaini',
      'gambar': 'https://covers.openlibrary.org/b/id/8231856-L.jpg',
      'deskripsi':
          'Buku yang membahas dasar-dasar Pancasila sebagai ideologi negara.',
    },
    {
      'judul': 'Matematika untuk SMA',
      'penulis': 'Prof. Sudirman',
      'gambar': 'https://covers.openlibrary.org/b/id/8227261-L.jpg',
      'deskripsi':
          'Buku panduan lengkap untuk pelajaran Matematika tingkat SMA.',
    },
    {
      'judul': 'Kimia Dasar',
      'penulis': 'Dr. Budi Santoso',
      'gambar': 'https://covers.openlibrary.org/b/id/8244151-L.jpg',
      'deskripsi':
          'Buku Kimia yang mempelajari struktur atom dan reaksi kimia.',
    },
    {
      'judul': 'Fisika Modern',
      'penulis': 'Albert Einstein',
      'gambar': 'https://covers.openlibrary.org/b/id/8215203-L.jpg',
      'deskripsi':
          'Penjelasan mendalam tentang teori relativitas dan mekanika kuantum.',
    },
    {
      'judul': 'Biologi untuk SMA',
      'penulis': 'Prof. Marzuki',
      'gambar': 'https://covers.openlibrary.org/b/id/8234729-L.jpg',
      'deskripsi':
          'Panduan belajar Biologi yang mencakup ekosistem hingga bioteknologi.',
    },
    // Tambahkan lebih banyak data buku sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perpustakaan'),
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
          itemCount: bukuList.length,
          itemBuilder: (context, index) {
            final buku = bukuList[index];

            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  // Gambar sampul buku
                  Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(buku['gambar']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Detail buku
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            buku['judul']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Penulis: ${buku['penulis']}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            buku['deskripsi']!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          // Tombol untuk detail atau pinjam
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Aksi untuk peminjaman buku
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Anda memilih untuk meminjam buku: ${buku['judul']}'),
                                    ),
                                  );
                                },
                                child: const Text('Pinjam'),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                onPressed: () {
                                  // Aksi untuk melihat detail buku
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Detail buku: ${buku['judul']}'),
                                    ),
                                  );
                                },
                                child: const Text('Detail'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
