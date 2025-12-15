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

        Icon(Icons.emoji_food_beverage_outlined, size: 100, color: Colors.red),
        Text("Tôi là đương kim Trương Đình Quốc Trung Mr.B Kim Longggg", 
        style: TextStyle(fontSize: 30, color: Colors.blue)),
      ],
    );
  }
}