import 'package:flutter/material.dart';
import 'package:flutter_nhom3/my_product.dart';
//import 'package:flutter_nhom3/myhomepage.dart';
//import 'package:flutter_nhom3/myplace.dart';
//import 'package:flutter_nhom3/myhomework.dart';
//import 'package:flutter_nhom3/myname.dart';
//import 'package:flutter_nhom3/myme.dart';
//import 'package:flutter_nhom3/myhours.dart';
//import 'package:flutter_nhom3/demgio.dart';
//import 'package:flutter_nhom3/demmau.dart';
//import 'package:flutter_nhom3/ungdung.dart';
//import 'package:flutter_nhom3/myaccount.dart';
//import 'package:flutter_nhom3/myregister.dart';
//import 'package:flutter_nhom3/myweight.dart';
import 'package:flutter_nhom3/myfeedback.dart';


void main(){
  //MyApp app = new MyApp();
  //runApp(app);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyProduct());
  }
}