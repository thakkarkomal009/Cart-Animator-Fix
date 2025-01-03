import 'package:cart_animator_fix/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem({
    super.key,
    required this.addToCartClick,
    required this.productModel,
  });

  final ProductModel productModel;
  final AddToCartClick addToCartClick;

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(color: Colors.lightGreen.shade400),
        ),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              key: widgetKey,
              alignment: Alignment.center,
              height: 270,
              child: Image.network(
                height: 180,
                widget.productModel.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.07,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.lightGreen.withValues(alpha: 0.3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.productModel.productName,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.green,
                    ),
                    onTap: () {
                      widget.addToCartClick(widgetKey, context);
                    },
                  )
                ],
              )),
        ]));
  }
}

typedef AddToCartClick = Function(GlobalKey key, BuildContext context);
