import 'package:cart_animator_fix/business_logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:cart_animator_fix/cart_animation_plugin/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatorAppBar extends StatefulWidget {
  const AnimatorAppBar(
      {super.key,
      required this.cartKey,
      this.onTapAddToCart,
      this.title,
      this.isBack,
      this.count});

  final GlobalKey<CartIconKey> cartKey;
  final OnTapAddToCart? onTapAddToCart;
  final String? title;
  final bool? isBack;
  final int? count;

  @override
  State<AnimatorAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<AnimatorAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[2],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: widget.isBack!,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop('result');
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Text(
                '${widget.title}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      widget.onTapAddToCart!();
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          height: 32,
                          width: 32,
                          child: AddToCartIcon(
                            key: widget.cartKey,
                            icon: Icon(Icons.shopping_cart_rounded),
                            badgeOptions: BadgeOptions(
                              active: false,
                            ),
                          ),
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: Center(
                            child: Text(
                              widget.count.toString(),
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}

typedef OnTapAddToCart = Function();
