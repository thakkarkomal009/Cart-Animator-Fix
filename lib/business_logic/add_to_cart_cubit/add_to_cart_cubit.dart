import 'package:bloc/bloc.dart';
import 'package:cart_animator_fix/cart_animation_plugin/add_to_cart_animation.dart';
import 'package:cart_animator_fix/util/app_constants.dart';
import 'package:flutter/material.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  late Function(GlobalKey, GlobalKey<CartIconKey>) runCartAnimation;

  void addToCartAnimation(Function runAddToCartAnimation) {
    runCartAnimation = (GlobalKey widgetKey, GlobalKey<CartIconKey> cartKey) {
      // Now, call the passed function (runAddToCartAnimation)
      runAddToCartAnimation(widgetKey, cartKey: cartKey);
    };
  }

  refreshCart() {
    emit(ProductCount(count));
  }

  addToCart() async {
    await Future.delayed(Duration(milliseconds: 200), () {
      count++;
      emit(ProductCount(count));
    });
  }
}
