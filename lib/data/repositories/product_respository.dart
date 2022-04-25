

import '../models/products.dart';
import '../services/product_service.dart';

class ProductsRepository {

  final ProductsService service;

  ProductsRepository(this.service);



  Future<List<Datum>?> fetchPosts() async {
    Product? posts = await service.fetchPosts();
    return posts?.data;
   //return posts.map((e) => Datum.fromJson(e)).toList();
  }
  
}