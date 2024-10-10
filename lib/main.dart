// Mengimpor pustaka Flutter untuk membangun antarmuka pengguna
import 'package:flutter/material.dart';

// Mengimpor file login.dart dari folder 'app', yang berisi halaman login
import 'app/login.dart';

// Fungsi utama yang menjalankan aplikasi dan memanggil kelas MyApp
void main() {
  runApp(MyApp());
}

// Kelas MyApp yang merupakan root dari aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengembalikan MaterialApp sebagai struktur aplikasi
    return MaterialApp(
      // Menentukan judul aplikasi
      title: 'SMK Negeri 4 App',

      // Mengatur tema aplikasi dengan warna dasar biru
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Menentukan halaman utama aplikasi (LoginScreen)
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
