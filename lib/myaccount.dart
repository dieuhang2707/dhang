import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'tonghopgiuaky.dart';




class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManHinhDangNhap();
  }
}

class ManHinhDangNhap extends StatefulWidget {
  const ManHinhDangNhap({super.key});

  @override
  State<ManHinhDangNhap> createState() => _ManHinhDangNhapState();
}

class _ManHinhDangNhapState extends State<ManHinhDangNhap> {
  final GlobalKey<FormState> khoa_form = GlobalKey<FormState>();
  final TextEditingController controller_ten_nguoi_dung = TextEditingController(
    text: "",
  );
  final TextEditingController controller_mat_khau = TextEditingController(
    text: "",
  );

  bool an_mat_khau = true;
  bool dang_tai = false;

  Future<void> xuLyDangNhap() async {
    if (khoa_form.currentState!.validate()) {
      setState(() => dang_tai = true);
      try {
        final response = await http.post(
          Uri.parse('https://dummyjson.com/auth/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': controller_ten_nguoi_dung.text,
            'password': controller_mat_khau.text,
            'expiresInMins': 60,
          }),
        );

        if (!mounted) return;

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          String newToken = data['accessToken'];
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đăng nhập thành công!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ManHinhProfile(accessToken: newToken),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sai tài khoản hoặc mật khẩu!'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi kết nối: $e'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        if (mounted) setState(() => dang_tai = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // THÊM DRAWER VÀO ĐÂY

      body: Form(
        key: khoa_form,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller_ten_nguoi_dung,
                decoration: const InputDecoration(
                  labelText: 'Tên người dùng',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Vui lòng nhập tên' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller_mat_khau,
                obscureText: an_mat_khau,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      an_mat_khau ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => an_mat_khau = !an_mat_khau),
                  ),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Vui lòng nhập mật khẩu' : null,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: dang_tai ? null : xuLyDangNhap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: dang_tai
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text('ĐĂNG NHẬP', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManHinhProfile extends StatefulWidget {
  final String accessToken;
  const ManHinhProfile({super.key, required this.accessToken});

  @override
  State<ManHinhProfile> createState() => _ManHinhProfileState();
}

class _ManHinhProfileState extends State<ManHinhProfile> {
  late Future<Map<String, dynamic>> _userProfileFuture;

  @override
  void initState() {
    super.initState();
    _userProfileFuture = layThongTinUser();
  }

  Future<Map<String, dynamic>> layThongTinUser() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/auth/me'),
      headers: {
        'Authorization': 'Bearer ${widget.accessToken}',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) return json.decode(response.body);
    throw Exception('Lỗi tải dữ liệu');
  }

  void xuLyDangXuat() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const TongHopGiuaKy()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hồ Sơ Cá Nhân'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: xuLyDangXuat, icon: const Icon(Icons.logout)),
        ],
      ),

      backgroundColor: Colors.grey[100],
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userProfileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(data),
                  const SizedBox(height: 16),
                  _buildSectionCard('Thông tin cá nhân', Icons.person, [
                    _buildInfoRow('Ngày sinh', data['birthDate']),
                    _buildInfoRow('Email', data['email']),
                    _buildInfoRow('SĐT', data['phone']),
                  ]),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: xuLyDangXuat,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.logout),
                    label: const Text('ĐĂNG XUẤT'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Không có dữ liệu'));
        },
      ),
    );
  }

  Widget _buildHeader(Map data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(data['image'] ?? ''),
          ),
          const SizedBox(height: 10),
          Text(
            '${data['firstName']} ${data['lastName']}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            '@${data['username']}',
            style: TextStyle(color: Colors.blue[800]),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, IconData icon, List<Widget> children) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue[900]),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
              ],
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value ?? 'N/A')),
        ],
      ),
    );
  }
}