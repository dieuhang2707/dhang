import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}
class _MyRegisterState extends State<MyRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool obscure = true;
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
            block6(),
          ],
        ),
      ),
    );
  }
  Widget block1() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.person_add, size: 26),
          SizedBox(width: 8),
          Text(
            "Đăng ký tài khoản",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
  Widget block2() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Họ và tên",
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
    ),
  );
}
  Widget block3() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Email",
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Không được để trống!";
          }
          if (!value.contains("@")) {
            return "Email không hợp lệ!";
          }
          return null;
        },
      ),
    ),
  );
}
  Widget block4() {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: passwordCtrl,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: "Mật khẩu",
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() => obscure = !obscure);
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Không được để trống!";
          }
          if (value.length < 6) {
            return "Mật khẩu phải ≥ 6 ký tự!";
          }
          return null;
        },
      ),
    );
  }
Widget block5() {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: passwordCtrl,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: "Nhập lại mật khẩu",
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() => obscure = !obscure);
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Không được để trống!";
          }
          if (value.length < 6) {
            return "Mật khẩu phải ≥ 6 ký tự!";
          }
          return null;
        },
      ),
    );
  }
  Widget block6() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Đăng ký thành công!")),
            );
          }
        },
        child: SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.check),
        label: Text("Đăng ký"),
      ),
    ),
  ),
);
}
}