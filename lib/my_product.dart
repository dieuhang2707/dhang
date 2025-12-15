import 'package:flutter/material.dart';
import 'package:flutter_nhom3/api.dart';
import 'package:flutter_nhom3/model/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: tabBar()),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: Test_api.getAllProducts(),
        builder: (context, red) {
          if (red.connectionState == ConnectionState.done) {
            return myListProduct(red.data!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget myListProduct(List<Product> ls) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.62,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: ls.length,
      itemBuilder: (context, red) {
        return myProduct(ls[red]);
      },
    );
  }

  Widget myProduct(Product p) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  p.image ?? "",
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            p.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            maxLines: 2, // Giới hạn 2 dòng
            overflow: TextOverflow.ellipsis, //dai qua thi ...
          ),
          SizedBox(height: 10),
          danhGia(p),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (p.price ?? 0).toString() + "\$",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "Đã bán " + (p.rating.count ?? 0).toString() + "k+",
style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tabBar() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Tìm kiếm...',
                      style: TextStyle(color: Colors.deepOrange, fontSize: 14),
                    ),
                  ),
                  Icon(Icons.camera_alt, color: Colors.grey, size: 20),
                ],
              ),
            ),
          ),

          const SizedBox(width: 15),
          const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(width: 15),
          const Icon(Icons.chat_outlined, color: Colors.white, size: 26),
        ],
      ),
    );
  }

  Widget danhGia(Product p) {
    return Row(
      children: [
        if (p.price <= 50.0) ...[
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrange),
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepOrange.withOpacity(0.2),
            ),
            child: Row(
              children: [
                Icon((Icons.thumb_up), color: Colors.deepOrange, size: 16),
                SizedBox(width: 5),
                Text(
                  'Rẻ Vô Địch',
                  style: TextStyle(fontSize: 13, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
        ],
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amberAccent),
            borderRadius: BorderRadius.circular(5),
            color: Colors.amberAccent.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 5),
              Text(
                (p.rating.rate ?? 0.0).toString(),
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}