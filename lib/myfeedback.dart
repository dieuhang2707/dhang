import 'package:flutter/material.dart';

class MyFeedback extends StatefulWidget {
  const MyFeedback({super.key});

  @override
  State<MyFeedback> createState() => _MyFeedbackState();
}

class _MyFeedbackState extends State<MyFeedback> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController contentCtrl = TextEditingController();
  int rating = 1; // mặc định 1 sao

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBody(),
    );
  }

  Widget myBody() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            block1(),
            block2(),
            block3(),
            block4(),
            block5(),
          ],
        ),
      ),
    );
  }
  Widget block1() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.feedback, color: Color.fromARGB(255, 113, 180, 235)),
          SizedBox(width: 8),
          Text("Gửi phản hồi",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue,),)
        ],
      ),
    );
  }
  Widget block2() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: nameCtrl,
        decoration: const InputDecoration(
          labelText: "Họ tên",
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Không được để trống!";
          }
          return null;
        },
      ),
    );
  }
  Widget block3() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Color.fromARGB(255, 240, 218, 22)),
          const SizedBox(width: 10),
          const Text("Đánh giá (1 - 5): "),
          DropdownButton<int>(
            value: rating,
            items: List.generate(5,(index) => DropdownMenuItem(
                value: index + 1,
                child: Text("${index + 1} sao"),
              ),
            ),
            onChanged: (value) {
              setState(() => rating = value!);
            },
          )
        ],
      ),
    );
  }
  Widget block4() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: contentCtrl,
        maxLines: 4,
        decoration: const InputDecoration(
          labelText: "Nội dung góp ý",
          prefixIcon: Icon(Icons.message),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Không được để trống!";
          }
          return null;
        },
      ),
    );
  }
  Widget block5() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.send),
        label: const Text("Gửi phản hồi"),
        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 104, 172, 227)),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Cảm ơn bạn đã gửi phản hồi: $rating sao"),
             ),
            );
          }
        },
      ),
    );
  }
}
