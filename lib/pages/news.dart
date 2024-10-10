import 'package:flutter/material.dart';

// Membuat sebuah kelas bernama NewsScreen yang merupakan turunan dari StatelessWidget
class NewsScreen extends StatelessWidget {
  // Daftar berita yang akan ditampilkan
  final List<Map<String, String>> news = [
    {
      'title': 'Lomba Teknologi SMK Negeri 4',
      'date': '27 September 2024',
      'image':
          'https://static01.nyt.com/images/2014/09/15/business/edtechjump1/edtechjump1-superJumbo.jpg',
      'description':
          'SMK Negeri 4 memenangkan lomba teknologi tingkat nasional yang diikuti oleh berbagai sekolah dari seluruh Indonesia.'
    },
    {
      'title': 'Pameran Karya Seni Siswa',
      'date': '20 September 2024',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUzzffI8ItZJOgMUM5nKCGLCY6klrOskmPvQ&s',
      'description':
          'Siswa SMK Negeri 4 berhasil menampilkan karya seni mereka dalam pameran yang diselenggarakan oleh Kementerian Pendidikan.'
    },
    {
      'title': 'Workshop Kewirausahaan',
      'date': '15 September 2024',
      'image':
          'https://technical.ly/wp-content/uploads/2013/12/workshop-body.jpg',
      'description':
          'SMK Negeri 4 mengadakan workshop kewirausahaan yang dihadiri oleh para ahli bisnis dan entrepreneur sukses.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Terbaru SMK Negeri 4'),
        centerTitle: true,
        backgroundColor: Colors.blue, // Warna AppBar
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return _buildNewsCard(
              news[index]['title']!,
              news[index]['date']!,
              news[index]['image']!,
              news[index]['description']!,
            );
          },
        ),
      ),
    );
  }

  // Fungsi untuk membuat kartu berita
  Widget _buildNewsCard(
      String title, String date, String imageUrl, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: 10), // Menambahkan margin vertikal antara kartu
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5, // Memberikan efek bayangan pada kartu
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian gambar berita
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul berita
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 5),
                // Tanggal berita
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                // Deskripsi singkat berita
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                // Tombol "Baca Selengkapnya"
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Aksi ketika tombol "Baca Selengkapnya" diklik
                      // Bisa diarahkan ke detail berita
                      print('Baca selengkapnya dari $title');
                    },
                    child: const Text(
                      'Baca Selengkapnya',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
