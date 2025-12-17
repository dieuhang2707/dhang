import 'package:flutter/material.dart';
import 'dart:math';

class DemMau extends StatefulWidget {
  const DemMau({super.key});

  @override
  State<DemMau> createState() => _DemMauState();
}
class _DemMauState extends State<DemMau> {
  Color brcollor = Colors.yellow;
  String brstring = 'màu vàng';
  List<String> list = ['màu đỏ','màu xanh','màu vàng','xanh biển','màu cam'];
  List<Color> listColor = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.orange
  ];
  void _doi(){
    setState(() {
      var random =  Random();
      var r =random.nextInt(listColor.length);
      brcollor = listColor[r];
      brstring = list[r];
    });
  }
  void _reset(){
    setState(() {
      brcollor = Colors.yellow;
      brstring = 'màu vàng';
    });
  } 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.colorize_sharp),
        
        title: Text("ứng dụng đếm màu",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.amber
    ),    
    body: Container(
      decoration: BoxDecoration(color: brcollor,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("màu hiện tại: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
          SizedBox(height: 15,),
          Text(' $brstring',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
          SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _doi, child: Text("đổi màu")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: _reset, child: Text("reset")),
            ],
          )
        ],
      ),
    ),
    );
  }
}