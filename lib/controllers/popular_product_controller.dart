import 'package:e_commerceapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController{

  final PopularProductRepo popularProductRepo;


  PopularProductController({ required this.popularProductRepo});
  List <dynamic> _popularProductList=[];
  List <dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded=> _isLoaded;
  int _quantity =0;
  int  get quantity => _quantity;


   Future <void > getPopularProductList() async{
     Response response = await popularProductRepo.getPopularProductList();
     if(response.statusCode==200){

       print("got product");
       _popularProductList =[];
       _popularProductList.addAll(Product.fromJson(response.body).products);
       _isLoaded= true;
       update();

     }else{
      print("no product");

     }
   }

   void setQuantity(bool isIncrement){
     if(isIncrement){
       _quantity = checkQuantity(_quantity+1);
       print("Quantity incremented to  $_quantity");

     }else
       {
         _quantity = checkQuantity(_quantity-1);
         print("Quantity incremented to  $_quantity");
       }
     update();
   }
   
    checkQuantity(int quantity){
     if(quantity<0){
       Get.snackbar("Item count " , "You can't reduce more!",
       backgroundColor: AppColors.mainColor,
         colorText: Colors.white,
       );
       return 0;
     }else if(quantity>20){
       Get.snackbar("Item count " , "You can't add more!",
         backgroundColor: AppColors.mainColor,
         colorText: Colors.white,
       );
       return 20;
     }else{
       return quantity;
     }
   }

   void initProduct(){
     _quantity=0;
   }







}