import 'package:flutter/material.dart';

import 'tonghopgiuaky.dart';
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 👇 ROUTER NẰM Ở ĐÂY
      initialRoute: '/',
      routes: {
        '/': (context) => const TongHopGiuaKy(),
        '/bt1': (context) => const MyHomePage(),
        '/bt2': (context) => const MyPlace(),
        '/bt3': (context) => const MyHomeWork(),
        '/bt4': (context) => const MyName(),
        '/bt5': (context) => const MyMe(),
        '/bt7': (context) => const DemGio(),
        '/bt8': (context) => const DemMau(),
        '/bt9': (context) => const UngDung(),
        '/bt10': (context) => const MyAccount(),
        '/bt11': (context) => const MyRegister(),
        '/bt12': (context) => const MyWeight(),
        '/bt13': (context) => const MyFeedback(),
        '/bt14': (context) => const MyProduct(),
      },
    );
  }
}
