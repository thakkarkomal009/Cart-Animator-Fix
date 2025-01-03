import 'package:cart_animator_fix/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatefulWidget {
  const CategoryListItem({
    super.key,
    required this.categoryClick,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;
  final CategoryClick categoryClick;

  @override
  State<CategoryListItem> createState() => _CategoryListItemItemState();
}

class _CategoryListItemItemState extends State<CategoryListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          widget.categoryClick(context);
        },
        child: Container(
            height: 60,
            width: 60,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.lightGreen),
            alignment: Alignment.center,
            child: Icon(
              widget.categoryModel.iconData,
              color: Colors.white,
              size: 32,
            )),
      ),
    );
  }
}

typedef CategoryClick = Function(BuildContext context);
