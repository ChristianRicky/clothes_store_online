import 'package:flutter/material.dart';

import '../../../constants.dart';

// kita membuat class featuredplants yang merupakan stateless widget
// dan mengicludekan key agar widget dinilai unik

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key key,
  }) : super(key: key);

// sebelum widget build kita harus mengoverride terlebih dahulu,
// kita pakai singlechildscrollview untuk objek yang ditampilkan saat
// gulir ke bawah lalu lokasi scroll diset ke samping setelah itu
// lalu kita buat turunan dari child dan mengambil file gambar
// yang sudah disediakan

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantCard(
            image: "assets/images/bottom_img_1.png",
          ),
          FeaturePlantCard(
            image: "assets/images/bottom_img_2.png",
          ),
        ],
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.image,
  }) : super(key: key);
  final String image;

// kita membuat widget baru tentunya kita harus mengoverride widget baru tersebut
// agar tidak tertumpuk dari classs widget lainnya didalamnya kita ambil informasi
// gambar lalu atur mengatur ukuran pading kiri,kanan dan bawah lalu kita mengatur
// lebaran dari container yang kita buat tersebut lalu kita mengatur membuat parameter
// boxdecoration yang digunakkan untuk mendekorasi kotak unutk menyimpan gambar
// tersebut lalu kita atur ketumpulan dari ujung box tersebut dengan circular
// image, decorative image digunakkan untuk menkonfigurasikan image dengan
// boxdecorative tersebut

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
