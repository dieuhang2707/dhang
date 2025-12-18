import 'package:flutter/material.dart';
import 'package:flutter_nhom3/api.dart';
import 'package:flutter_nhom3/model/product.dart';
import 'cart_page.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  // ====== GIỎ HÀNG + TÌM KIẾM ======
  List<Product> _list = [];
  List<Product> _listSearch = [];
  List<Product> cart = [];
  TextEditingController _searchController = TextEditingController();
  // ===============================

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
      body: FutureBuilder<List<Product>>(
        future: Test_api.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_list.isEmpty && snapshot.hasData) {
              _list = snapshot.data!;
              _listSearch = _list;
            }
            return myListProduct(_listSearch);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget myListProduct(List<Product> ls) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.62,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: ls.length,
      itemBuilder: (context, index) {
        return myProduct(ls[index]);
      },
    );
  }

  Widget myProduct(Product p) {
    return Container(
      padding: const EdgeInsets.all(10),
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
          const SizedBox(height: 10),
          Text(
            p.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          danhGia(p),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${p.price ?? 0}\$",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  setState(() {
                    cart.add(p);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đã thêm vào giỏ hàng")),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= TAB BAR =================
  Widget tabBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _listSearch = _list
                            .where((p) => p.title
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Tìm kiếm...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Icon(Icons.camera_alt,
                    color: Colors.grey, size: 20),
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),

        // ===== ICON GIỎ HÀNG =====
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartPage(cart: cart),
              ),
            );
          },
          child: Stack(
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 26,
              ),
              if (cart.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cart.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(width: 15),
        const Icon(Icons.chat_outlined, color: Colors.white, size: 26),
      ],
    );
  }

  // ================= ĐÁNH GIÁ =================
  Widget danhGia(Product p) {
    return Row(
      children: [
        if (p.price <= 50.0) ...[
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrange),
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepOrange.withOpacity(0.2),
            ),
            child: Row(
              children: const [
                Icon(Icons.thumb_up,
                    color: Colors.deepOrange, size: 16),
                SizedBox(width: 5),
                Text(
                  'Rẻ Vô Địch',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amberAccent),
            borderRadius: BorderRadius.circular(5),
            color: Colors.amberAccent.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 5),
              Text(
                (p.rating.rate ?? 0.0).toString(),
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
