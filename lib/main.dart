import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/posts_screen.dart';

import 'cubit/posts_cubit.dart';
import 'data/repositories/product_respository.dart';
import 'data/services/product_service.dart';

void main() {
  runApp(PaginationApp(repository: ProductsRepository(ProductsService()),));
}
class PaginationApp extends StatelessWidget {
   final ProductsRepository? repository;

    PaginationApp({Key? key, this.repository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductsCubit(repository!),
        child: PostsView(),

      ),
    );
  }
}



