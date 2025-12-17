import 'package:flutter/material.dart';

class MyWeight extends StatefulWidget {
  const MyWeight({super.key});

  @override
  State<MyWeight> createState() => _MyWeightState();
}

class _MyWeightState extends State<MyWeight> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController heightCtrl = TextEditingController();
  final TextEditingController weightCtrl = TextEditingController();
  double? bmi;
  String? status;

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
            SizedBox(height: 15),
            block2(),
            SizedBox(height: 15),
            block3(),
            SizedBox(height: 15),
            block4(),
            SizedBox(height: 15),
            block5(),
          ],
        ),
      ),
    );
  }
  Widget block1() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Icon(Icons.calculate, size: 26),
          SizedBox(width: 8),
          Text("Tính chỉ số BMI",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
  Widget block2() {
    return TextFormField(
      controller: heightCtrl,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: "Chiều cao (m)",
        prefixIcon: Icon(Icons.height),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Không được để trống!";
        }
        return null;
      },
    );
  }
  Widget block3() {
    return TextFormField(
      controller: weightCtrl,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: "Cân nặng (kg)",
        prefixIcon: Icon(Icons.fitness_center),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Không được để trống!";
        }
        return null;
      },
    );
  }
  Widget block4() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            double h = double.parse(heightCtrl.text);
            double w = double.parse(weightCtrl.text);
            setState(() {
              bmi = w / (h * h);
              if (bmi! < 18.5) {
                status = "Thiếu cân";
              } else if (bmi! < 25) status = "Bình thường";
              else if (bmi! < 30) status = "Thừa cân";
              else status = "Béo phì";
            });
          }
        },
        icon: Icon(Icons.play_arrow),
        label: Text("Tính BMI"),
      ),
    );
  }
  Widget block5() {
    if (bmi == null) return SizedBox();
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text("Chỉ số BMI: ${bmi!.toStringAsFixed(2)}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text("Phân loại: $status",style: TextStyle(fontSize: 16, color: Colors.red),),
        ],
      ),
    );
  }
}
