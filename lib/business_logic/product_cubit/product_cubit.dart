import 'package:bloc/bloc.dart';
import 'package:cart_animator_fix/models/category_model.dart';
import 'package:cart_animator_fix/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(HomeInitial()){
    fetchProductData();
  }

  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];

  initialCategory() {
    return categoryList = [
      CategoryModel(iconData: Icons.mouse, name: 'Mouse'),
      CategoryModel(iconData: Icons.laptop, name: 'Laptop'),
      CategoryModel(iconData: Icons.phone_android, name: 'Mobile'),
      CategoryModel(iconData: Icons.headphones, name: 'Headphone'),
      CategoryModel(iconData: Icons.lock_clock, name: 'Clock'),
    ];
  }

  fetchProductData() {
    productList = [
      ProductModel(
        brandName: "Apple",
        productName: "iPhone 14 Pro",
        rating: '4.8',
        ratingCount: '1200',
        currentPrice: '999.99',
        mrp: '1099.99',
        imageUrl:
        "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1716439967/Croma%20Assets/Entertainment/Home%20Theatres%20and%20Audio%20Systems/Images/224037_0_bbvgux.png?tr=w-1000",
        isLike: true,
        productImageList: [
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1716439967/Croma%20Assets/Entertainment/Home%20Theatres%20and%20Audio%20Systems/Images/224037_0_bbvgux.png?tr=w-1000",
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1716439967/Croma%20Assets/Entertainment/Home%20Theatres%20and%20Audio%20Systems/Images/224037_0_bbvgux.png?tr=w-1000",
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1716439967/Croma%20Assets/Entertainment/Home%20Theatres%20and%20Audio%20Systems/Images/224037_0_bbvgux.png?tr=w-1000",
        ],
        description:
        "The latest iPhone 14 Pro with an A16 Bionic chip and an advanced camera system.",
      ),
      ProductModel(
        brandName: "Samsung",
        productName: "Galaxy S23 Ultra",
        rating: '4.7',
        ratingCount: '980',
        currentPrice: '899.99',
        mrp: '999.99',
        imageUrl:
        "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1730268829/Croma%20Assets/Entertainment/Speakers%20and%20Media%20Players/Images/233861_0_tagev7.png?tr=w-1000",
        isLike: false,
        productImageList: [
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1730268829/Croma%20Assets/Entertainment/Speakers%20and%20Media%20Players/Images/233861_0_tagev7.png?tr=w-1000",
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1730268829/Croma%20Assets/Entertainment/Speakers%20and%20Media%20Players/Images/233861_0_tagev7.png?tr=w-1000",
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1730268829/Croma%20Assets/Entertainment/Speakers%20and%20Media%20Players/Images/233861_0_tagev7.png?tr=w-1000",
        ],
        description:
        "Samsung's premium smartphone with the best display and S Pen integration.",
      ),
      ProductModel(
        brandName: "Sony",
        productName: "WH-1000XM5",
        rating: '4.6',
        ratingCount: '1500',
        currentPrice: '349.99',
        mrp: '399.99',
        imageUrl:
        "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1714040858/Croma%20Assets/Communication/Mobile%20Accessories/Images/303998_0_qfk8mc.png?tr=w-1000",
        isLike: false,
        productImageList: [
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1714040858/Croma%20Assets/Communication/Mobile%20Accessories/Images/303998_0_qfk8mc.png?tr=w-1000",
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1714040858/Croma%20Assets/Communication/Mobile%20Accessories/Images/303998_0_qfk8mc.png?tr=w-1000",
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1714040858/Croma%20Assets/Communication/Mobile%20Accessories/Images/303998_0_qfk8mc.png?tr=w-1000",
        ],
        description:
        "Industry-leading noise-canceling headphones with superior sound quality.",
      ),
      ProductModel(
        brandName: "Nike",
        productName: "Air Max 270",
        rating: '4.5',
        ratingCount: '870',
        currentPrice: '129.99',
        mrp: '149.99',
        imageUrl:
        "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1725959433/Croma%20Assets/Communication/Mobiles/Images/309695_0_hpoykn.png?tr=w-1000",
        isLike: true,
        productImageList: [
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1725959433/Croma%20Assets/Communication/Mobiles/Images/309695_0_hpoykn.png?tr=w-1000",
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1725959433/Croma%20Assets/Communication/Mobiles/Images/309695_0_hpoykn.png?tr=w-1000",
        ],
        description:
        "Stylish and comfortable Nike sneakers designed for everyday wear.",
      ),
      ProductModel(
        brandName: "Dell",
        productName: "XPS 15 Laptop",
        rating: '4.7',
        ratingCount: '560',
        currentPrice: '1499.99',
        mrp: '1699.99',
        imageUrl:
        "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1724858615/Croma%20Assets/Computers%20Peripherals/Laptop/Images/306647_0_cdu0nd.png?tr=w-1000",
        isLike: false,
        productImageList: [
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1724858615/Croma%20Assets/Computers%20Peripherals/Laptop/Images/306647_0_cdu0nd.png?tr=w-1000",
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1724858615/Croma%20Assets/Computers%20Peripherals/Laptop/Images/306647_0_cdu0nd.png?tr=w-1000",
        ],
        description:
        "High-performance laptop with stunning display and build quality.",
      ),
    ];
  }
}