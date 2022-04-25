import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/products.dart';
import '../data/repositories/product_respository.dart';

part 'product_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit(this.repository) : super(ProductsInitial());

  int page = 1;
  final ProductsRepository repository;

  void loadPosts() {
    if (state is ProductsLoading) return;

    final currentState = state;

    var oldPosts = <Datum>[];
    if (currentState is ProductsLoaded) {
      oldPosts = currentState.posts;
    }

    emit(ProductsLoading(oldPosts, isFirstFetch: page == 1));

    // var body=
    // {
    //   "page": page,
    //  "perPage": 5
    // };
    repository.fetchPosts().then((newPosts) {
      page++;

      final posts = (state as ProductsLoading).oldPosts;
      posts.addAll(newPosts!);

      emit(ProductsLoaded(posts));
    });
  }

}
