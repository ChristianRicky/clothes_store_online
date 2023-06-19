import 'package:clothes_store/dataclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tblitem = FirebaseFirestore.instance.collection("tb_item");

class Database {
  static Stream<QuerySnapshot> getData() {
    return tblitem.snapshots();
  }

  static Future<void> tambahData({required itemproduk item}) async {
    DocumentReference docRef = tblitem.doc(item.name);

    await docRef
        .set(item.toJson())
        .whenComplete(() => print("data berhasil diinput"))
        .catchError((e) => print(e));
  }

  static Future<void> hapusData({required String judulhapus}) async {
    DocumentReference docRef = tblitem.doc(judulhapus);

    await docRef
        .delete()
        .whenComplete(() => print("data berhasil dihapus"))
        .catchError((e) => print(e));
  }
}
