import 'package:dio/dio.dart';
import 'package:flutter_nhom3/model/article.dart';
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

  Future<List<Article>> getAllArticles() async {
    var dio = Dio();
    try {
      var response = await dio.request(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=34709ef262ed49bdabb8eeca0a82ae9c',
        options: Options(method: 'GET'),
      );
      List<Article> listArticles = [];

      if (response.statusCode == 200) {
        var jsonData = response.data;

        if (jsonData['articles'] != null) {
          var listData = jsonData['articles'] as List;

          listArticles = listData.map((e) => Article.fromJson(e)).toList();
        }
      }
      return listArticles;
    } catch (e) {
      print("Lỗi API: $e");
      return [];
    }
  }
}

var Test_api = API();
