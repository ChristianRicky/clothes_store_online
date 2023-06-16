import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clothes_store/screens/home/home_screen.dart';

import 'firebase_options.dart';

// kode dibawah digunakkan untuk menjalankan aplikasi
void main() async {
  var firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// disini kita membuat class myapp dengan tipe class StatelessWidget,
// pastinya di saat kita membuat widget baru dibawah super class, kita harus membuat
// @override terlebih dahulu lalu, lalu membuat widget dengan parameter context didalamnya
// lalu material app untuk mengidentifikan desain material yang dibuat oleh google
// lalu untuk menghilangkan banner yang muncul saat dalam mode debug dibutuhkan
// properti debugshowcheckedmodebanner dan diatur menjadi false, lalu memberi judul aplikasi,
// dan ditampilkan di awal aplikasi

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Baju',
      home: HomeScreen(),
    );
  }
}
