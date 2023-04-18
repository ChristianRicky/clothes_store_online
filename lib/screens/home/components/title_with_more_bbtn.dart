import 'package:flutter/material.dart';

import '../../../constants.dart';

// kita membuat class titlewithmorebtn yang merupakan statelesswidget
// key digunakkan untuk mengindentifikasikan widget secara unik,
// title digunakan untuk menampilkan judul pada widget,
// dan press digunakan untuk menentukan aksi ketika tombol "More" diklik.
// lalu final string dan final funcion digunakkan untuk mendeklarasi sebuah variable

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  // lalu kita harus mengoverride terlebih dahulu sebelum membuild widget baru,
  // kita kembalikan widget padding yang dikonfigurasi menjadi default
  // dengan turunan baris di dalam turunan widget dan kita panggil class
  // untuk garis bawah tulisan yaitu TitleWithCustomUnderline

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
        ],
      ),
    );
  }
}

// ini adalah isi dari konfigurasi garis bawah text dengan class yang merupakan
// statelesswidget kita buat parameter serta variable key untuk mengidentifikasikan
// keunikkan widget kita juga membuat instance text, lalu kita buat tipe data string
// yang ada dalam variable text

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  // lalu kita mengoverride kode dibawahnya agar tidak tertumpuk dengan class lain
  // kita buat container dan membuat code untuk mengatur ketinggian dari uderline
  // lalu kita buat turunan stack yang digunakkan untuk menampung widget lain di
  // dalam widget kita atur jarak dengan padding lalu kita buat turunan text untuk
  // menkonfigurasi text tersebut, lalu yang terakhir ktia buat posisi dari text
  // dan underline tersebut serta konfigurasi jarak,ketinggian dan warna pada
  // underline

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
