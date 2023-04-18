import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/screens/home/components/body.dart';

// kelas dibawah ini adalah configurasi untuk web yang kita miliki termasuk
//appbar,body dan navigasi bar bawah

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

// disini kita membuat appbar dengan parameter class dibawah ini kita kembalikan
// appbar lalu evalation 0 digunakkan untuk tidak menampilkan bayangan lalu, kita
// buat tombol ikon yang isinya ikon yang sudah tersedia pada flutter dan tentunya
// karena tombol kita harus memakai onpressed

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
