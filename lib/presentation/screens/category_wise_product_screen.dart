import 'package:cart_animator_fix/business_logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:cart_animator_fix/business_logic/product_cubit/product_cubit.dart';
import 'package:cart_animator_fix/cart_animation_plugin/add_to_cart_animation.dart';
import 'package:cart_animator_fix/models/category_model.dart';
import 'package:cart_animator_fix/util/app_constants.dart';
import 'package:cart_animator_fix/widget/animator_app_bar.dart';
import 'package:cart_animator_fix/widget/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWiseProductScreen extends StatefulWidget {
  const CategoryWiseProductScreen({
    super.key,
  });

  @override
  State<CategoryWiseProductScreen> createState() =>
      _CategoryWiseProductScreenState();
}

class _CategoryWiseProductScreenState extends State<CategoryWiseProductScreen> {
  List<CategoryModel> categoryDetailList = [];

  late GlobalKey<CartIconKey> globalAnimationKey;
  late GlobalKey widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    print("Category Wise Product Screen initState called");

    globalAnimationKey = GlobalKey<CartIconKey>();
    widgetKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        } else {
          Navigator.of(context).pop("result");
        }
      },
      child: BlocConsumer<ProductCubit, ProductState>(
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
                          return AnimatorAppBar(
                              cartKey: globalAnimationKey,
                              onTapAddToCart: () {},
                              title: 'Product List',
                              isBack: false,
                              count: count);
                        }
                        return AnimatorAppBar(
                            cartKey: globalAnimationKey,
                            onTapAddToCart: () {},
                            title: 'Product List',
                            isBack: false,
                            count: count);
                      },
                    ),
                    SizedBox(
                      height: 50,
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("Category Wise Product Screen disposed");
  }

  @override
  void didUpdateWidget(covariant CategoryWiseProductScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Category Wise Product Screen updated");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("Category Wise Product Screen deactivated");
  }
}
