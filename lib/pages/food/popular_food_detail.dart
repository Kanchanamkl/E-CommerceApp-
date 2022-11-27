import 'package:e_commerceapp/models/products_model.dart';
import 'package:e_commerceapp/pages/cart/cartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constant.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';
import '../home/main_food_page.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pagedId;
  final String page;

  PopularFoodDetails({Key? key, required this.pagedId , required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel productModel = Get.find<PopularProductController>().popularProductList[pagedId];

    Get.find<PopularProductController>().initProduct(productModel, Get.find<CartController>());
    // print("page is id "+pagedId.toString());
    // print("productModel name is"+productModel.name.toString());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Background image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 370,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstant.BASE_URL + "/uploads/" + productModel.img!,
                    ),
                  )),
                )),
            // icon widget
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if(page=="cartPage"){
                          Get.toNamed(RouteHelper.getCartPage());
                        }else{
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios_new)),
                 GetBuilder<PopularProductController>(builder: (PopProdController){
                   return Stack(
                     children: [
                       AppIcon(icon: Icons.shopping_cart_outlined),

                       PopProdController.totalItems>=1?
                       Positioned(
                         right:0 , top: 0,
                           child: GestureDetector(
                               onTap: () {
                                 PopProdController.totalItems >=1?Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()))
                                     : print("nothing on cart");  // Get.find(PopularProductController) = controller
                                 // Get.to(()=>CartPage());
                               },
                               child: AppIcon(icon: Icons.circle, size:20, iconColor:Colors.transparent, backgroundColor: AppColors.mainColor,)
                           )
                       ):
                       Container(),
                       PopProdController.totalItems>=1?
                       Positioned(
                           right: 5, top: 3,
                           child: BigText(text:PopProdController.totalItems.toString(),
                           size:12, color: Colors.white)):
                       Container(),
                     ]
                   );
                 })
                ],
              ),
            ),
            // introduction of food
            Positioned(
              left: 0,
              right: 0,
              top: 340,
              child: Container(
                height: 330,
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: productModel.name!),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height15),
                    // Expandable text widget
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpendableTextWidget(
                                text: productModel.description!)))
                  ],
                ),
              ),
            )
          ],
        ),
        // Food Description
        // Bottom Navigation part
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
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
                        width: 100,
                        height: 130,
                        padding: EdgeInsets.all(Dimensions.height5),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    popularProduct.setQuantity(false);
                                  },
                                  child: Icon(Icons.remove,
                                      color: AppColors.signColor)),
                              BigText(
                                  text: popularProduct.inCartItems.toString()),
                              GestureDetector(
                                  onTap: () {
                                    popularProduct.setQuantity(true);
                                  },
                                  child: Icon(Icons.add,
                                      color: AppColors.signColor)),
                            ])),
                    // Add to Cart Part
               GestureDetector(
                  onTap: () {
                    popularProduct.addItem(productModel);
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
                              popularProduct.addItem(productModel);
                            },
                            child: BigText(
                                text: "\$10.0 | Add to cart",
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
