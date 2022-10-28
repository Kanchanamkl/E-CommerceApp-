import 'package:e_commerceapp/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/repository/popular_product_repo.dart';
import '../data/repository/recomm_product_repo.dart';
import '../models/products_model.dart';
import '../utils/colors.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  late CartController _cartController;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];

  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;


  int get quantity => _quantity;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("got recomm product");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print("no product");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print("Quantity incremented to  $_quantity");
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("Quantity decremented to  $_quantity");
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      Get.snackbar(
        "Item count ",
        "You can't reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (_inCartItems + quantity > 20) {
      Get.snackbar(
        "Item count ",
        "You can't add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel productModel, CartController cartController) {
    _quantity = 0;
    _inCartItems = 0;
    _cartController = cartController;
    bool exist = false;
    exist = _cartController.existInCart(productModel);

    if (exist) {
      _inCartItems = _cartController.getQuantity(productModel);
    }
    print("the quantity in the cart is " + _inCartItems.toString());
  }

  void addItem(ProductModel productModel) {
    _cartController.addItem(productModel, _quantity);
    _quantity=0;
    _inCartItems = _cartController.getQuantity(productModel);
    _cartController.itemsMap.forEach((key, value) {
      print("The id is " +
          value.id.toString() +
          " The quantity is " +
          value.quantity.toString());
    });
  update();
  }

  int get totalItems{
    return _cartController.totalItems;
  }
}
