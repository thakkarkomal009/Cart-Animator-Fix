import 'package:cart_animator_fix/models/product_model.dart';
import 'package:cart_animator_fix/widget/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({
    super.key,
    required this.productList,
    required this.addToCartClick,
  });

  final List<ProductModel> productList;
  final AddToCartClick addToCartClick;

  @override
  State<ProductListView> createState() => _CommonHorizontalListViewState();
}

class _CommonHorizontalListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 80),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ProductListItem(
                addToCartClick: widget.addToCartClick,
                productModel: widget.productList[index]);
          },
          itemCount: widget.productList.length,
        ));
  }
}

typedef AddToCartClick = Function(GlobalKey key, BuildContext context);
