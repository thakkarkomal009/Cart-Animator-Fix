import 'package:cart_animator_fix/business_logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:cart_animator_fix/business_logic/product_cubit/product_cubit.dart';
import 'package:cart_animator_fix/presentation/screens/category_wise_product_screen.dart';
import 'package:cart_animator_fix/presentation/screens/home_screen.dart';
import 'package:cart_animator_fix/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppConstants.homeScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: AddToCartCubit(),
                ),
                BlocProvider.value(
                  value: ProductCubit(),
                ),
              ],
              child: HomeScreen(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return getTransition(animation, child);
          },
          fullscreenDialog: true,
        );

      case AppConstants.categoryWiseProductScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider.value(
              value: AddToCartCubit(),
              child: BlocProvider.value(
                value: ProductCubit(),
                child: const CategoryWiseProductScreen(),
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return getTransition(animation, child);
          },
          fullscreenDialog: true,
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: AddToCartCubit(),
                ),
                BlocProvider.value(
                  value: ProductCubit(),
                ),
              ],
              child: HomeScreen(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return getTransition(animation, child);
          },
          fullscreenDialog: true,
        );
    }
  }
}

SlideTransition getTransition(Animation<double> animation, Widget child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
