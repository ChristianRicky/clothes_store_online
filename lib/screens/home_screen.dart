import 'package:clothes_store/dataclass.dart';
import 'package:clothes_store/screens/detail_data.dart';
import 'package:clothes_store/screens/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../dbservices.dart';

class Main_Page extends StatelessWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Daftar Produk"), actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: const Text('Logout'),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => detailData()));
            },
            backgroundColor: Colors.yellow,
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
                    String lvjudul = dsdata['name'];
                    String lvIsi = dsdata['price'];
                    return ListTile(
                      title: Text(lvjudul),
                      subtitle: Text(lvIsi),
                      onTap: () {
                        final dataedit =
                            itemproduk(name: lvjudul, price: lvIsi);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    detailData(dataDetail: dataedit)));
                      },
                      onLongPress: () {},
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outlined),
                        onPressed: () => {
                          Database.hapusData(judulhapus: lvjudul),
                        },
                      ),
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
