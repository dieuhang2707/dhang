import 'package:flutter/material.dart';

class UngDung extends StatefulWidget {
  const UngDung({super.key});

  @override
  State<UngDung> createState() => _UngDungState();
}
class _UngDungState extends State<UngDung> {
   int count = 0;
   Color get_color(){
     if(count==1) return Colors.red;
     if(count==2) return Colors.green;
     if(count==3) return Colors.yellow;
     if(count==4) return Colors.blue;
     if(count==5) return Colors.orange;
     return Colors.black;
   }
   void _tang(){
     setState(() {
       count++;
     });
   }
   void _giam(){
     setState(() {
       count--;
     });
   }
   void _reset(){
     setState(() {
       count=0;
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.colorize_sharp),
        title: Text("ứng dụng đếm số",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 245, 221, 3),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),),
      body: Container(        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Giá Trị Hiện Tại: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 15 ,),
            Text('$count',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60,color: get_color()),),
            SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _tang , child: Text("tăng")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: _giam , child: Text("giam")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: _reset , child: Text("reset")),
            ],
          )
        ]
        ),
      ),
    );
  }
}