import 'package:e_commerceapp/models/cart_model.dart';
import 'package:e_commerceapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';
import 'cart_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> _responseProductList =[];

  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cartController;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int _quantity = 0;

  int get quantity => _quantity;
  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("got product");
      _popularProductList = [];
      _responseProductList =Product.fromJson(response.body).products;
      _popularProductList.addAll(_responseProductList);
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
      print("Quantity decrement to  $_quantity");
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
      if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
      }
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
    //print("exit or not " + exist.toString());
    if (exist) {
      _inCartItems = _cartController.getQuantity(productModel);
    }
    print("the quantity in the cart is " + _inCartItems.toString());
    // get form storage _ inCartItems=3
  }

  void addItem(ProductModel productModel) {

    _cartController.addItem(productModel, _quantity);
    _quantity = 0;
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
