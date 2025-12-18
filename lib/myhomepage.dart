import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody(),);
  }
  Widget myBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text("Xin chào mọi người!", 
          style: TextStyle(color: Colors.purple, fontSize: 40)),
        ),

        Icon(Icons.school, size: 100, color: Colors.red),
        Text("Tôi là Nguyễn Diệu Hằng \nsinh viên trường Đại Học Khoa Học", 
        textAlign: TextAlign.center, // căn giữa chữ
        style: TextStyle(fontSize: 31, color: Colors.blue)),
      ],
    );
  }
}