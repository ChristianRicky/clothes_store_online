import 'package:clothes_store/dbservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clothes_store/screens/home/home_screen.dart';

import 'firebase_options.dart';

// kode dibawah digunakkan untuk menjalankan aplikasi
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MaterialApp(
      title: "FIREBASE CRUD",
      home: MyApp(),
    ),
  );
}

// disini kita membuat class myapp dengan tipe class StatelessWidget,
// pastinya di saat kita membuat widget baru dibawah super class, kita harus membuat
// @override terlebih dahulu lalu, lalu membuat widget dengan parameter context didalamnya
// lalu material app untuk mengidentifikan desain material yang dibuat oleh google
// lalu untuk menghilangkan banner yang muncul saat dalam mode debug dibutuhkan
// properti debugshowcheckedmodebanner dan diatur menjadi false, lalu memberi judul aplikasi,
// dan ditampilkan di awal aplikasi

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase CRUD"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blueGrey,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream: Database.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('ERROR');
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    DocumentSnapshot dsdata = snapshot.data!.docs[index];
                    String lvjudul = dsdata['itemjudul'];
                    String lvIsi = dsdata['itemisi'];
                    return ListTile(
                      onTap: () {},
                      onLongPress: () {},
                      title: Text(lvjudul),
                      subtitle: Text(lvIsi),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 0.0),
                  itemCount: snapshot.data!.docs.length);
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.pinkAccent,
                ),
              ),
            );
          },
        ));
  }
}
