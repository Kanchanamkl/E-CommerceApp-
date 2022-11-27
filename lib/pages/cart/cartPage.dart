import 'package:e_commerceapp/controllers/cart_controller.dart';
import 'package:e_commerceapp/pages/food/popular_food_detail.dart';
import 'package:e_commerceapp/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constant.dart';
import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../home/main_food_page.dart';

class CartPage extends StatelessWidget {


  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
          top: Dimensions.height20 * 3,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                //Get.to(()=>MainFoodPage());
              },
              child: AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  size: Dimensions.iconSize24),
            ),
            SizedBox(width: Dimensions.width20 * 5),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.initial);
                //Get.to(()=>MainFoodPage());
              },
              child: AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  size: Dimensions.iconSize24),
            ),
            AppIcon(
                icon: Icons.shopping_cart,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                size: Dimensions.iconSize24),
          ])),
      Positioned(
          top: Dimensions.height20 * 5,
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: 0,
          child: Container(
              //color: Colors.lightGreenAccent,
              margin: EdgeInsets.only(top: Dimensions.height10),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController) {
                  var _cartList = cartController.getItemList;
                  return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 100,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].productM!);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getPopularFood(
                                          popularIndex, "cartPage"));
                                    } else {
                                      var recommendedIndex = Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].productM);
                                      Get.toNamed(
                                          RouteHelper.getRecommendedFood(
                                              recommendedIndex, "cartPage"));
                                    }


                                  },
                                  child: Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.height5),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                AppConstant.BASE_URL +
                                                    "/uploads/" +
                                                    cartController
                                                        .getItemList[index]
                                                        .img!),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white)),
                                ),
                                SizedBox(width: Dimensions.width10),
                                Expanded(
                                    child: Container(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BigText(
                                                  text: _cartList[index]
                                                      .name
                                                      .toString(),
                                                  color: Colors.black54),
                                              SmallText(text: "Spicy"),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text: _cartList[index]
                                                          .price
                                                          .toString(),
                                                      color: Colors.redAccent,
                                                    ),
                                                    Container(
                                                        width: 70,
                                                        height: 40,
                                                        margin: EdgeInsets.only(
                                                            right: Dimensions
                                                                .height5),
                                                        padding: EdgeInsets.only(
                                                            right: Dimensions
                                                                .height5),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimensions
                                                                      .radius20),
                                                          color: Colors.white,
                                                        ),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    cartController.addItem(
                                                                        _cartList[index]
                                                                            .productM!,
                                                                        -1);
                                                                  },
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: AppColors
                                                                          .signColor)),
                                                              BigText(
                                                                  text: _cartList[
                                                                          index]
                                                                      .quantity
                                                                      .toString() // popularProduct.inCartItems.toString()
                                                                  ),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    cartController.addItem(
                                                                        _cartList[index]
                                                                            .productM!,
                                                                        1);
                                                                    print(
                                                                        "being tapped");
                                                                  },
                                                                  child: Icon(
                                                                      Icons.add,
                                                                      color: AppColors
                                                                          .signColor)),
                                                            ])),
                                                  ])
                                            ])))
                              ],
                            ));
                      });
                }),
              )))
    ]),
        bottomNavigationBar:
        GetBuilder<CartController>(builder: (cartProduct) {
          return Container(
            //color: Colors.lightGreenAccent,
              height: 110,
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                ),
                color: AppColors.buttonBackgroundColor,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Add and Remove Part
                    Container(
                        width: 80,
                        height: 130,
                        padding: EdgeInsets.all(Dimensions.height5),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              BigText(
                                  text:"\$"+ cartProduct.totalAmount.toString()),

                            ])),
                    // Add to Cart Part
                    GestureDetector(
                        onTap: () {
                          //popularProduct.addItem(productModel);
                        },
                        child: Container(
                            width: 200,
                            height: 130,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: Dimensions.height10,
                                bottom: Dimensions.height10,
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor,
                            ),
                            child: GestureDetector(
                                onTap: () {
                                //  popularProduct.addItem(productModel);
                                },
                                child: BigText(
                                    text: "Check out",
                                    color: Colors.white,
                                    size: 20))

                          // child: Row(
                          //
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children:[
                          //       Icon(Icons.remove , color: AppColors.signColor),
                          //       BigText(text: "0" ),
                          //       Icon(Icons.add , color: AppColors.signColor),
                          //
                          //
                          //     ]
                          // )

                        ))
                  ]));
        }));




  }
}
