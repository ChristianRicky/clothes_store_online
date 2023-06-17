import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

// bottom navigation bar
// kita mebuat class untuk bar navigasi bawah dengan class yang merupakan stateless widget
// kita konfigurasikan dengan key untuk mengidentifikasikan widget secara unik

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

// kita membuat widget baru, sebelumnya kita override widget tersebut agar tidak menumpuk class lain
// kita membuat container untuk mengeset padding kiri,kanan,dan default pada bagian bawah
// lalu kita membuat dekorasi untuk box navigasi bar dengan warna biru
// lalu mebuat turunan dengan mengambil aset yang ada pada bawaan flutter
// yaitu icom flower,heart, dan user-icon
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 9, 140, 248),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/flower.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/heart-icon.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
