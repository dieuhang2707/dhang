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
  int selectedIndex = -1; // -1 = Trang chủ

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
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.menu_book,
                          color: Colors.white, size: 36),
                      SizedBox(width: 10),
                      Text(
                        'MENU BÀI TẬP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nhóm 3',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            // ===== TRANG CHỦ =====
            drawerItem(-1, Icons.home, 'Trang chủ'),
            const Divider(),

            drawerItem(0, Icons.home_work, 'Bài 1: MyHomePage'),
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
          ? const TrangChu()
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
        Navigator.pop(context);
      },
    );
  }
}

/* ================= TRANG CHỦ ================= */

class TrangChu extends StatelessWidget {
  const TrangChu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.school, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),

            const Text(
              'LẬP TRÌNH ỨNG DỤNG\nTHIẾT BỊ DI ĐỘNG',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: Column(
                  children: const [
                    InfoRow(
                      icon: Icons.person,
                      label: 'Họ tên',
                      value: 'Nguyễn Diệu Hằng',
                    ),
                    SizedBox(height: 10),
                    InfoRow(
                      icon: Icons.badge,
                      label: 'Mã sinh viên',
                      value: '22T1020599',
                    ),
                    SizedBox(height: 10),
                    InfoRow(
                      icon: Icons.group,
                      label: 'Nhóm',
                      value: 'Nhóm 3',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= INFO ROW ================= */

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Text(
          '$label:',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(value, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}