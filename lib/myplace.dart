import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Place')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              block1(),
              block2(),
              block3(),
              block4(),
            ],
          ),
        ),
      ),
    );
  }

  Widget block1() {
    var src =
        "https://bizweb.dktcdn.net/thumb/1024x1024/100/460/952/products/ts205-1715401246524.jpg?v=1715401251853";
    return Image.network(
      src,
      width: double.infinity,
      //height: 300,
      fit: BoxFit.cover, 
    );
  }

  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Van gogh",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 21, 39, 70))),
              Text("HÀ LAN",
                  style: TextStyle(
                      color: Color.fromARGB(255, 11, 83, 24))),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.green),
              SizedBox(width: 5),
              Text("7"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    var color = const Color.fromARGB(255, 109, 126, 183);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            Icon(Icons.call, color: color),
            Text("Call", style: TextStyle(color: color))
          ]),
          Column(children: [
            Icon(Icons.directions, color: color),
            Text("Route", style: TextStyle(color: color))
          ]),
          Column(children: [
            Icon(Icons.share, color: color),
            Text("Share", style: TextStyle(color: color))
          ]),
        ],
      ),
    );
  }

  Widget block4() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "Bức tranh thể hiện hình ảnh mặt trăng sáng giữa bầu trời tối. "
        "Nó giống như một lời nhắc rằng trong cuộc sống, dù có khó khăn hay "
        "u ám đến đâu thì luôn tồn tại một nguồn sáng, một niềm hy vọng.",
      ),
    );
  }
}
