import 'package:cart_animator_fix/business_logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:cart_animator_fix/business_logic/product_cubit/product_cubit.dart';
import 'package:cart_animator_fix/cart_animation_plugin/add_to_cart_animation.dart';
import 'package:cart_animator_fix/models/category_model.dart';
import 'package:cart_animator_fix/util/app_constants.dart';
import 'package:cart_animator_fix/widget/animator_app_bar.dart';
import 'package:cart_animator_fix/widget/category_list_view.dart';
import 'package:cart_animator_fix/widget/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoryDetailList = [];

  late GlobalKey<CartIconKey> globalAnimationKey;
  late GlobalKey widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    print("HomeScreen initState called");

    globalAnimationKey = GlobalKey<CartIconKey>();
    widgetKey = GlobalKey();

    categoryDetailList = context.read<ProductCubit>().initialCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: AddToCartAnimation(
              height: 30,
              width: 30,
              opacity: 0.85,
              dragAnimation: const DragToCartAnimationOptions(
                rotation: false,
              ),
              jumpAnimation: const JumpAnimationOptions(),
              createAddToCartAnimation: (Function runAddToCartAnimation) {
                context
                    .read<AddToCartCubit>()
                    .addToCartAnimation(runAddToCartAnimation);
              },
              child: Wrap(
                children: [
                  BlocBuilder<AddToCartCubit, AddToCartState>(
                    builder: (context, state) {
                      if (state is ProductCount) {
                        count = state.count;
                      }
                      return AnimatorAppBar(
                          cartKey: globalAnimationKey,
                          onTapAddToCart: () {},
                          title: 'Home',
                          isBack: false,
                          count: count);
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CategoryListView(
                    categoryList: categoryDetailList,
                    categoryClick: (context) async {
                      final result = await Navigator.pushNamed(
                        context,
                        AppConstants.categoryWiseProductScreen,
                      );
                      if (result != null) {
                        print('Result from Category Product: $count');
                        context.read<AddToCartCubit>().refreshCart();
                      }
                    },
                  ),
                  ProductListView(
                    productList: context.read<ProductCubit>().productList,
                    addToCartClick: (key, context) async {
                      await context
                          .read<AddToCartCubit>()
                          .runCartAnimation(key, globalAnimationKey);
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        await Future.delayed(Duration(milliseconds: 200), () {
                          if (context.mounted) {
                            context.read<AddToCartCubit>().addToCart();
                          }
                        });
                      });
                    }, //clickFromDashboard,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("HomeScreen disposed");
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("HomeScreen updated");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("HomeScreen deactivated");
  }
}
