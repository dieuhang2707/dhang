import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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
          ],
        ),
      ),
    );
  }

  // BLOCK 1 – Tiêu đề
  Widget block1() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        "Form Đăng nhập",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  // BLOCK 2 – Username
  Widget block2() {
    return TextFormField(
      controller: usernameCtrl,
      decoration: const InputDecoration(
        labelText: "Tên người dùng",
        hintText: "Nhập tên người dùng",
        prefixIcon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Không được để trống!";
        }
        return null;
      },
    );
  }

  // BLOCK 3 – Password
  Widget block3() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: passwordCtrl,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: "Mật khẩu",
          hintText: "Nhập mật khẩu",
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

  // BLOCK 4 – Nút đăng nhập
  Widget block4() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Đăng nhập thành công!")),
            );
          }
        },
        child: const Text("Đăng nhập"),
      ),
    );
  }
}
