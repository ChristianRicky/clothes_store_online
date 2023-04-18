import 'package:flutter/material.dart';

import '../../../constants.dart';

// kita membuat kelas yang merupakan statelesswidget dengan key yang digunakkan
// untuk mendefinisikan widget unik

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);
// tentunya kita mengoverride kode dibawahnya lalu kita membuild widget baru untuk
// memasukkan konfigurasi serta gambar produk, kita membuat child baris lalu turunan
// widget, disini kita mengambil konfigurasi dari class recomendplantcard lalu kita
// isikan gambar,nama produk,berasal dari wilayah mana, dan harga produk
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/images/image_1.png",
            title: "lidah buaya",
            country: "indonesia",
            price: 25000,
          ),
          RecomendPlantCard(
            image: "assets/images/image_2.png",
            title: "calathea",
            country: "indonesia",
            price: 21000,
            press: () {},
          ),
        ],
      ),
    );
  }
}

// disini kita membuat kelas yang akan jadi konfigurasi untuk produk, tepatnya
// pada recomend plants kita mebuat stateless widget dengan kontruksi key untuk
// widget unik lalu kita buat variable seperti pada kode dibawah, dan kita buat
// konfigurasi untuk tipe data

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

// pada awalnya kita mengoverride kode dibawahnya agar class lain tidak tertumpuk
// lalu kita ambil informasi gambar yang ada pada perangkat dan setelah itu kita
// membuat container lalu kita mengatur batas serta tata letak paddingnya, lalu
// kita membuat child kolom, lalu kita mengambil asset gambar agar dapat ditampilkan
// pada widget, lalu kita pakai gesturedetector untuk mendeteksi gesture tekan pada
// widget lalu kita membuat child container lagi dan konfigurasi padding, dekorasi
// untuk mengatur warna box serta ketumpulan sudut lalu box shadow digunakkan untuk
// menamberikann bayangan terhadap widget, lalu kita buat child dengan config baris
// yang merupakan widget lalu kita ambil variable title dan county dan ada sedikit
// pengaturan teks, dan yang terakhir kita ambil variable price untuk harganya

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 95, 255, 207),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
