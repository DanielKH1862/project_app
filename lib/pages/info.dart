import 'package:flutter/material.dart';

// Membuat sebuah kelas bernama InfoScreen yang merupakan turunan dari StatelessWidget
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info SMK Negeri 4'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // Warna AppBar
      ),
      body: SingleChildScrollView(
        // Memungkinkan halaman di-scroll jika konten melebihi batas layar
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Banner dengan gambar header
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://bbppmpvbispar.kemdikbud.go.id/portal/wp-content/uploads/2020/03/belajar-daring-800x445.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Bagian Judul
              const Text(
                'Tentang SMK Negeri 4',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),

              // Deskripsi sekolah
              const Text(
                'SMK Negeri 4 adalah sekolah menengah kejuruan yang berfokus pada pengembangan keterampilan siswa '
                'dalam berbagai bidang seperti teknologi, bisnis, dan seni. Sekolah ini memiliki berbagai program '
                'keahlian yang dirancang untuk mempersiapkan siswa menghadapi dunia kerja dan industri.',
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5), // Mengatur spasi antar baris teks
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Bagian Program Keahlian dengan List dan Ikon
              const Text(
                'Program Keahlian:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),

              // Daftar program keahlian dengan ikon
              Column(
                children: [
                  _buildProgramItem(
                      Icons.computer, 'Teknik Komputer dan Jaringan (TKJ)'),
                  _buildProgramItem(Icons.movie, 'Multimedia'),
                  _buildProgramItem(
                      Icons.code, 'Rekayasa Perangkat Lunak (RPL)'),
                  _buildProgramItem(
                      Icons.business, 'Bisnis Daring dan Pemasaran'),
                  _buildProgramItem(Icons.animation, 'Animasi'),
                ],
              ),
              const SizedBox(height: 20),

              // Bagian Fasilitas
              const Text(
                'Fasilitas:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),

              // Daftar fasilitas dengan ikon
              Column(
                children: [
                  _buildFacilityItem(Icons.computer, 'Laboratorium Komputer'),
                  _buildFacilityItem(
                      Icons.video_camera_front, 'Studio Animasi'),
                  _buildFacilityItem(Icons.library_books, 'Perpustakaan'),
                  _buildFacilityItem(Icons.build, 'Ruang Praktik Siswa'),
                  _buildFacilityItem(Icons.wifi, 'Internet Cepat'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun item program dengan ikon
  Widget _buildProgramItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membangun item fasilitas dengan ikon
  Widget _buildFacilityItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
