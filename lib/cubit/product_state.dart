part of 'posts_cubit.dart';

@immutable
abstract class ProductState {}

class ProductsInitial extends ProductState {}
class ProductsLoaded extends ProductState {
  final List<Datum> posts;

  ProductsLoaded(this.posts);
}

class ProductsLoading extends ProductState {
  final List<Datum> oldPosts;
  final bool isFirstFetch;

  ProductsLoading(this.oldPosts, {this.isFirstFetch=false});
}