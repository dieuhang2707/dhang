import 'package:flutter/material.dart';

class MyMe extends StatelessWidget {
  const MyMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Mybody(),backgroundColor: Colors.white,);
  }
  Widget Mybody(){
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
      children: [
        item1(),
        item2(),
        item3(),
        item4(),
        item5(),
        item6(),
      ],
      ),
    );
}

Widget item1(){
 return Container(
  color: const Color.fromARGB(255, 17, 26, 145),
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
   child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Icon(Icons.keyboard_arrow_left,color: Colors.black, ),
                  Text(
                    "Xung quanh vị trí hiện tại",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                       ),
                  ),
                  
                  
                  Text(
                    "23 thg 10 - 24 thg 10",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    
                  ),
                ],
              ),
            ),
          ),
     ],
   ),
   
 );
}

Widget item2(){
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 220, 215, 215)),
      borderRadius: BorderRadius.circular(2),
    ),
    child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
        TextButton.icon(onPressed: (){},icon: Icon(Icons.import_export), label: Text("Sắp Xếp",style: TextStyle(color: Colors.black,fontSize: 17))),
        
        TextButton.icon(onPressed: (){},icon: Icon(Icons.filter_alt_outlined), label: Text("Lọc",style: TextStyle(color: Colors.black,fontSize: 17))),
       
        TextButton.icon(onPressed: (){},icon: Icon(Icons.map_outlined), label: Text("Bản đồ",style: TextStyle(color: Colors.black,fontSize: 17))),
    
      ]
    ),
  );
}
Widget item3(){
  return Text("   757 chỗ nghỉ",style: TextStyle(color: Colors.black,fontSize: 17));
} 
Widget item4(){
  return GridView.count(crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: 3/2,
    physics: NeverScrollableScrollPhysics(),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    padding: EdgeInsets.all(10),
    children: [
      ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Image.network("https://media-cdn.tripadvisor.com/media/photo-s/1c/93/2d/a5/anhill-boutique.jpg",fit: BoxFit.cover),
        ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("aNhill Boutique",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          Icon(Icons.favorite_border),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
            ]),
              
         
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("9.5 ",style: TextStyle(color: Colors.blue,fontSize: 15),),
              SizedBox(width: 5,),
              Text(" Xuất sắc",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Text("-  95 đánh giá",style: TextStyle(color: Colors.black,fontSize: 15),),],
          ), 
          Text("Huế • Cách bạn 0,6km",style: TextStyle(color: Colors.black,fontSize: 15),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("1 suite riêng tư:",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              Text(" 1 giường",style: TextStyle(color: Colors.black,fontSize: 15),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Text("USS",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              Text(" 109",style: TextStyle(color: Colors.black,fontSize: 15),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("đã bao gồm thuế và phí",style: TextStyle(color: Colors.black,fontSize: 10),),],
              )
         
          
          
          
        ],
      )
        
    ]
  );
}
Widget item5(){
  return GridView.count(crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: 3/2,
    physics: NeverScrollableScrollPhysics(),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    padding: EdgeInsets.all(10),
    children: [
      ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Image.network("https://cf.bstatic.com/xdata/images/hotel/max1024x768/487525818.jpg?k=ca598d7e0e9252161bfe31512cc77b26701de2f74c614f4d48db02277ceb3622&o=",fit: BoxFit.cover),
        ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("An Nam Hue Botique",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          Icon(Icons.favorite_border),
          ],),
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("9.2 ",style: TextStyle(color: Colors.blue,fontSize: 15),),
              SizedBox(width: 5,),
              Text(" tuyệt hảo",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Text("-  34 đánh giá",style: TextStyle(color: Colors.black,fontSize: 15),),],
          ), 
          Text("Cư chính • Cách bạn 0,9km",style: TextStyle(color: Colors.black,fontSize: 15),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("1 Khách Sạn:",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              Text(" 1 giường",style: TextStyle(color: Colors.black,fontSize: 15),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Text("USS",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              Text(" 20",style: TextStyle(color: Colors.black,fontSize: 15),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("đã bao gồm thuế và phí",style: TextStyle(color: Colors.black,fontSize: 10),),],
              )
         
          
          
          
        ],
      )
        
    ]
  );
}
Widget item6(){
  return GridView.count(crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: 3/2,
    physics: NeverScrollableScrollPhysics(),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    padding: EdgeInsets.all(10),
    children: [
      ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Image.network("https://cf.bstatic.com/xdata/images/hotel/max1024x768/715792411.jpg?k=53ab4824955f4d74604f4bec2af797727b3057e36f244abefcaa657c3616a3fc&o=",fit: BoxFit.cover),
        ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("Hue Villa",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          Icon(Icons.favorite_border),
          ],),
          Text("được quản lý bởi 1 host cá nhân",style: TextStyle(color: Colors.black,fontSize: 10),),
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("8.0 ",style: TextStyle(color: Colors.blue,fontSize: 12),),
              SizedBox(width: 5,),
              Text(" rất tốt",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Text("-  1 đánh giá",style: TextStyle(color: Colors.black,fontSize: 12),),],
          ), 
          Text("Cư chính • Cách bạn 1.3km",style: TextStyle(color: Colors.black,fontSize: 15),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("biệt thự nguyên căn:1000",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
              Text(" 4 giường , 3 phòng ngủ",style: TextStyle(color: Colors.black,fontSize: 12),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Text("USS",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              Text(" 285",style: TextStyle(color: Colors.black,fontSize: 15),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("chỉ cìn 1 căn với giá này",style: TextStyle(color: Colors.red,fontSize: 12),),],
              ),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("đã bao gồm thuế và phí",style: TextStyle(color: Colors.black,fontSize: 10),),],
              )
         
          
          
          
        ],
      )
        
    ]
  );
}
}