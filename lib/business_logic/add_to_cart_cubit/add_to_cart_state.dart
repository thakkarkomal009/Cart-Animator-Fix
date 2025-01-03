part of 'add_to_cart_cubit.dart';

sealed class AddToCartState {}

class ProductCount extends AddToCartState {
  int count;

  ProductCount(this.count);
}

final class AddToCartInitial extends AddToCartState {}
