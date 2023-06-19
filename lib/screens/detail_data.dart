import 'dart:html';

import 'package:clothes_store/dataclass.dart';
import 'package:clothes_store/dbservices.dart';

import 'package:flutter/material.dart';

class detailData extends StatefulWidget {
  final itemproduk? dataDetail;
  const detailData({Key? key, this.dataDetail}) : super(key: key);

  @override
  State<detailData> createState() => _detailDataState();
}

class _detailDataState extends State<detailData> {
  final _ctrname = TextEditingController();
  final _ctrprice = TextEditingController();
  bool _isDisabled = false;
  @override
  void dispose() {
    _ctrname.dispose();
    _ctrprice.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _ctrname.text = widget.dataDetail?.name ?? "";
    _ctrprice.text = widget.dataDetail?.price ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataDetail == null) _isDisabled = true;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Data Note'),
      ),
      body: Container(
        margin: EdgeInsets.all(0.0),
        child: Column(
          children: [
            TextField(
              controller: _ctrname,
              enabled: _isDisabled,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "masukkan nama item"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: _ctrprice,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "masukkan harga"),
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                final data =
                    itemproduk(name: _ctrname.text, price: _ctrprice.text);
                Database.tambahData(item: data);
                Navigator.pop(context);
              },
              child: Text('simpan data'),
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('hapus'),
            ),
          ],
        ),
      ),
    );
  }
}
