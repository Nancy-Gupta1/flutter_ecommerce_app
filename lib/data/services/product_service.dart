import 'dart:convert';

import 'package:http/http.dart';

import '../models/products.dart';

class ProductsService {

  final baseUrl = "http://205.134.254.135/~mobile/MtProject/public/api/product_list";

  Future<Product?> fetchPosts() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'token': 'eyJhdWQiOiI1IiwianRpIjoiMDg4MmFiYjlmNGU1MjIyY2MyNjc4Y2FiYTQwOGY2MjU4Yzk5YTllN2ZkYzI0NWQ4NDMxMTQ4ZWMz',
      };
     // print(body);
      print(baseUrl);
      final response = await post(Uri.parse(baseUrl),headers: requestHeaders);
      print(response);
      return jsonDecode(response.body);
    } catch (err) {
      return null;
    }
  }
  
}