import 'dart:async';
import 'package:flutter/material.dart';
import '/pages/homepages/jadwalmapel.dart';
import '/pages/homepages/kelas.dart';
import '/pages/homepages/nilai.dart';
import '/pages/homepages/perpustakaan.dart';
import '/pages/homepages/tugas.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  final List<String> _images = [
    'https://pusdatin.kemdikbud.go.id/wp-content/uploads/2020/03/banner-rumbel-belajar-di-rumah-1.jpg',
    'https://www.infosatu.co/wp-content/uploads/2020/04/a86b7d14748a1e0618fe64598e8ce7f4.jpg',
    'https://bbppmpvbispar.kemdikbud.go.id/portal/wp-content/uploads/2020/03/belajar-daring-800x445.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardItems = [
      {
        'icon': Icons.book,
        'color': Colors.blue,
        'label': 'Perpustakaan',
        'route': PerpustakaanScreen(),
      },
      {
        'icon': Icons.school,
        'color': Colors.blue,
        'label': 'Kelas',
        'route': KelasScreen(),
      },
      {
        'icon': Icons.assignment,
        'color': Colors.blue,
        'label': 'Tugas',
        'route': TugasScreen(),
      },
      {
        'icon': Icons.schedule,
        'color': Colors.blue,
        'label': 'Jadwal Mata Pelajaran',
        'route': JadwalMapelScreen(),
      },
      {
        'icon': Icons.grade,
        'color': Colors.blue,
        'label': 'Nilai',
        'route': NilaiScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang di SMK Negeri 4'),
        foregroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Banner Slideshow dengan indikator halaman
          Stack(
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      _images[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _images.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Bagian List Card
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
              itemCount: cardItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => cardItems[index]['route'],
                      ),
                    );
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
                          colors: [
                            cardItems[index]['color'].withOpacity(0.7),
                            cardItems[index]['color']
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            cardItems[index]['icon'],
                            size: 50,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            cardItems[index]['label'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
