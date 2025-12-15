import 'package:dio/dio.dart';
import 'package:flutter_nhom3/model/product.dart';

class API {
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    var response = await dio.request('https://fakestoreapi.com/products');
    List<Product> listProduct = [];
    if (response.statusCode == 200) {
      List data = response.data;
      listProduct = data.map((x) => Product.fromJson(x)).toList();
    } else {
      print("Error");
    }
    return listProduct;
  }
}

var Test_api = API();