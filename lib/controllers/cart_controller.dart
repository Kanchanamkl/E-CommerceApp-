import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _itemsMap = {};

  Map<int, CartModel> get itemsMap => _itemsMap;



  void addItem(ProductModel productModel, int quantity) {
    int totalQuantity = 0;

    if (_itemsMap.containsKey(productModel.id!)) {
      _itemsMap.update(productModel.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: productModel.id,
          name: productModel.name,
          price: productModel.price,
          img: productModel.img,
          quantity: value.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
        );
      });

      if (totalQuantity <= 0) {
        _itemsMap.remove(productModel.id);
      }
    } else {
      //print("length of the item is " +_items.length.toString());
      if (quantity > 0) {
        _itemsMap.putIfAbsent(productModel.id!, () {
          // print(" adding item to the cart : id ->" + product.id.toString()+ "  Quantity ->"+quantity.toString());
          return CartModel(
            id: productModel.id,
            name: productModel.name,
            price: productModel.price,
            img: productModel.img,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),
          );
        });
      } else {
        Get.snackbar(
            "Item count ", "You should at least add an item in the cart!",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }

    // _items.forEach((key, value) {
    //   print("ID : " +key.toString() +" quantity is " + value.quantity.toString());
    // });


  }

  bool existInCart(ProductModel productModel) {
    if (_itemsMap.containsKey(productModel.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel productModel) {
    int quantity = 0;
    if (_itemsMap.containsKey(productModel.id)) {
      _itemsMap.forEach((key, value) {
        if (key == productModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity =0;
    _itemsMap.forEach((key, value){
      totalQuantity = totalQuantity+value.quantity!;
    });
    return totalQuantity ;
  }




  // CartsModel -> 0,1,2,3...  -->> e.value (point to values of _itemsMap)
  List<CartModel> get getItemList{
    return     _itemsMap.entries.map((e) {
      return e.value;
    }).toList();
    }



}
