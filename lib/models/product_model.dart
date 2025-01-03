class ProductModel {
  final String brandName;
  final String productName;
  final String rating;
  final String ratingCount;
  final String currentPrice;
  final String mrp;
  final String imageUrl;
  final bool isLike;
  final String description;
  final List<String> productImageList;

  ProductModel({
    required this.brandName,
    required this.productName,
    required this.rating,
    required this.ratingCount,
    required this.currentPrice,
    required this.mrp,
    required this.imageUrl,
    this.isLike = false,
    required this.productImageList,
    required this.description,
  });
}
