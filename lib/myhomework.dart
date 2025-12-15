import 'package:flutter/material.dart';

class MyHomeWork extends StatelessWidget {
  const MyHomeWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody(),);
  }
  Widget myBody(){
    return SafeArea(
      // padding: const EdgeInsets.all(10),
      child: ListView(
        scrollDirection: Axis.vertical,
        // children:List.generate(10, (index)=> item1()),
  
        children: [
          item1(),
          item2(),
          item3(),
          item4(),
          item5(),
          item6(),
          item7(),
        ],
      ),
    );
  }
}
    //return SafeArea(
      
    //);  //cách để lập lại nhiều lần
  
  Widget item1(){
    var img = "https://64.media.tumblr.com/2e03a890a9b52c15d9ee20b171f5cbf2/6a29c976a8657590-d6/s1280x1920/660a75547b73fa22cfedc5542b6d36b15911e62c.png";
    //"https://pbs.twimg.com/media/El6Eky7VoAABora?format=jpg&name=large";
    //"https://cdn-images.vtv.vn/thumb_w/1200/2022/12/15/151222-rm-bts-16710725725391938966421.jpg";
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius:BorderRadius.circular(20), color: const Color.fromARGB(255, 251, 250, 249),
        image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover, // ảnh phủ kín Container, không méo (có thể crop)
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
          // ảnh phủ kín
  ),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phần mềm mã nguồn mở - Nhóm 2", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white) ), 
                  Text("2025-2026.1.TIN4063.002", style: TextStyle(color: Colors.white)),
                ],
              ),
              Text("60 học viên", style: TextStyle(color: Colors.white))
            ],
          ),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }
  Widget item2(){
    var img ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHNe-Aek3GIMS4GJri6iTaAH0m4SYNQwR9qA&s";
    //"https://thethaovanhoa.mediacdn.vn/Upload/QDN4HPIpMrJuoPNyIvLDA/files/2022/03/Jin-persona6.jpg";
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius:BorderRadius.circular(20), color: const Color.fromARGB(255, 251, 250, 249),
        image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover, // ảnh phủ kín Container, không méo (có thể crop)
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
          // ảnh phủ kín
  ),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lập trình phân tán - Nhóm 2", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white)),
                  Text("2025-2026.1.TIN4313.002", style: TextStyle(color: Colors.white)),
                ],
              ),
              Text("53 học viên", style: TextStyle(color: Colors.white))
            ],
          ),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }
  Widget item3(){
    var img ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwgQFGbiutv7ujQ4Y9WiAgaexZ1r9l9BENgw&s";
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius:BorderRadius.circular(20), color: const Color.fromARGB(255, 251, 250, 249),
        image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover, // ảnh phủ kín Container, không méo (có thể crop)
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
          // ảnh phủ kín
  ),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lập trình ứng dụng các thiết bị di động - Nhóm 3", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),),
                  Text("2025-2026.1.TIN4403.003", style: TextStyle(color: Colors.white)),
                ],
              ),
              Text("60 học viên", style: TextStyle(color: Colors.white))
            ],
          ),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }
  Widget item4(){
    var img ="https://pbs.twimg.com/media/EmOq7qoVMAEIx0O?format=jpg&name=large";
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius:BorderRadius.circular(20), color: const Color.fromARGB(255, 251, 250, 249),
        image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover, // ảnh phủ kín Container, không méo (có thể crop)
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
          // ảnh phủ kín
  ),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Web ngữ nghĩa - Nhóm 1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),),
                  Text("2025-2026.1.TIN4423.001", style: TextStyle(color: Colors.white)),
                ],
              ),
              Text("28 học viên", style: TextStyle(color: Colors.white))
            ],
          ),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }
  Widget item5(){
    var img ="https://pbs.twimg.com/media/El06-oRU4AA_-64.jpg";
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius:BorderRadius.circular(20), color: const Color.fromARGB(255, 251, 250, 249),
        image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover, // ảnh phủ kín Container, không méo (có thể crop)
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
          // ảnh phủ kín
  ),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Đồ án công nghệ phần mềm - Nhóm 4", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),),
                  Text("2025-2026.1.TIN4503.004", style: TextStyle(color: Colors.white)),
                ],
              ),
              Text("40 học viên", style: TextStyle(color: Colors.white))
            ],
          ),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }
  Widget item6(){
    var img ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3U6hc-L7QO3QfC0ez9rm5A6I7MLNtagZw7A&s";
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius:BorderRadius.circular(20), color: const Color.fromARGB(255, 251, 250, 249),
        image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover, // ảnh phủ kín Container, không méo (có thể crop)
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
          // ảnh phủ kín
  ),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Java nâng cao - Nhóm 2", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),),
                  Text("2025-2026.1.TIN4013.002", style: TextStyle(color: Colors.white)),
                ],
              ),
              Text("58 học viên", style: TextStyle(color: Colors.white))
            ],
          ),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }
  Widget item7(){
    var img = "https://pbs.twimg.com/media/El_OKPQVMAA4ZBP?format=jpg&name=large";
    //"https://pbs.twimg.com/media/FT20IxvXsAUaIdQ.jpg:large";
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius:BorderRadius.circular(20), color: const Color.fromARGB(255, 251, 250, 249),
        image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover, // ảnh phủ kín Container, không méo (có thể crop)
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
          // ảnh phủ kín
  ),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tư tưởng Hồ Chí Minh - Nhóm 4", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),),
                  Text("2024-2025.3.LLCTTT2.004", style: TextStyle(color: Colors.white)),
                ],
              ),
              Text("80 học viên", style: TextStyle(color: Colors.white))
            ],
          ),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }
