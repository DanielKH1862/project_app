import 'package:flutter/material.dart';

class NilaiScreen extends StatelessWidget {
  final List<Map<String, dynamic>> nilaiList = [
    {
      'mataPelajaran': 'Matematika',
      'nilai': 95,
    },
    {
      'mataPelajaran': 'Bahasa Indonesia',
      'nilai': 85,
    },
    {
      'mataPelajaran': 'Fisika',
      'nilai': 70,
    },
    {
      'mataPelajaran': 'Kimia',
      'nilai': 88,
    },
    {
      'mataPelajaran': 'Biologi',
      'nilai': 92,
    },
    {
      'mataPelajaran': 'Sejarah',
      'nilai': 60,
    },
    // Tambahkan lebih banyak mata pelajaran jika diperlukan
  ];

  Color _getColorByScore(int score) {
    if (score >= 90) {
      return Colors.green;
    } else if (score >= 75) {
      return Colors.yellow[700]!;
    } else {
      return Colors.red;
    }
  }

  Icon _getIconByScore(int score) {
    if (score >= 90) {
      return const Icon(Icons.check_circle, color: Colors.white, size: 40);
    } else if (score >= 75) {
      return const Icon(Icons.warning, color: Colors.white, size: 40);
    } else {
      return const Icon(Icons.error, color: Colors.white, size: 40);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nilai Mata Pelajaran'),
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
          itemCount: nilaiList.length,
          itemBuilder: (context, index) {
            final nilai = nilaiList[index];
            final color = _getColorByScore(nilai['nilai']);

            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.7),
                      color,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _getIconByScore(nilai['nilai']),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nilai['mataPelajaran'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Nilai: ${nilai['nilai']}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '${nilai['nilai']}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
