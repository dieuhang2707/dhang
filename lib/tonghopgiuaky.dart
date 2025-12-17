import 'package:flutter/material.dart';
import 'myhomepage.dart';
import 'myplace.dart';
import 'myhomework.dart';
import 'myname.dart';
import 'myme.dart';
import 'demgio.dart';
import 'demmau.dart';
import 'ungdung.dart';
import 'myaccount.dart';
import 'myregister.dart';
import 'myweight.dart';
import 'myfeedback.dart';
import 'my_product.dart';

class TongHopGiuaKy extends StatefulWidget {
  const TongHopGiuaKy({super.key});

  @override
  State<TongHopGiuaKy> createState() => _TongHopGiuaKyState();
}

class _TongHopGiuaKyState extends State<TongHopGiuaKy> {
  int selectedIndex = -1;

  final List<Widget> pages = const [
    MyHomePage(),
    MyPlace(),
    MyHomeWork(),
    MyName(),
    MyMe(),
    DemGio(),
    DemMau(),
    UngDung(),
    MyAccount(),
    MyRegister(),
    MyWeight(),
    MyFeedback(),
    MyProduct(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('TỔNG HỢP GIỮA KỲ'),
  centerTitle: true,
  leading: selectedIndex != -1
      ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selectedIndex = -1; // quay về trang chủ
            });
          },
        )
      : null,
),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
  decoration: const BoxDecoration(
    color: Colors.blue,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: const [
          Icon(
            Icons.menu_book,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(width: 10),
          Text(
            'MENU BÀI TẬP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 6),
      const Text(
        'Nhóm 3',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 24,
        ),
      ),
    ],
  ),
),



            drawerItem(0, Icons.home, 'Bài 1: MyHomePage'),
            drawerItem(1, Icons.place, 'Bài 2: MyPlace'),
            drawerItem(2, Icons.book, 'Bài 3: MyHomeWork'),
            drawerItem(3, Icons.person, 'Bài 4: MyName'),
            drawerItem(4, Icons.face, 'Bài 5: MyMe'),
            drawerItem(5, Icons.timer, 'Bài 7: DemGio'),
            drawerItem(6, Icons.color_lens, 'Bài 8: DemMau'),
            drawerItem(7, Icons.apps, 'Bài 9: UngDung'),
            drawerItem(8, Icons.account_circle, 'Bài 10: MyAccount'),
            drawerItem(9, Icons.app_registration, 'Bài 11: MyRegister'),
            drawerItem(10, Icons.monitor_weight, 'Bài 12: MyWeight'),
            drawerItem(11, Icons.feedback, 'Bài 13: MyFeedback'),
            drawerItem(12, Icons.shopping_cart, 'Bài 14: MyProduct'),
          ],
        ),
      ),

      body: selectedIndex == -1
          ? const Center(
              child: Text(
                'Lập trình ứng dụng thiết bị di động',
                style: TextStyle(fontSize: 18),
              ),
            )
          : pages[selectedIndex],
    );
  }

  Widget drawerItem(int index, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Navigator.pop(context); // đóng drawer
      },
    );
  }
}
