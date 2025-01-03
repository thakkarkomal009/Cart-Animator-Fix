import 'package:cart_animator_fix/models/category_model.dart';
import 'package:cart_animator_fix/widget/category_list_item.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    super.key,
    required this.categoryList,
    required this.categoryClick,
  });

  final List<CategoryModel> categoryList;
  final CategoryClick categoryClick;

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return CategoryListItem(
              categoryModel: widget.categoryList[index],
              categoryClick: (context) => widget.categoryClick(context),
            );
          },
          itemCount: widget.categoryList.length,
        ));
  }
}

typedef CategoryClick = Function(BuildContext context);
