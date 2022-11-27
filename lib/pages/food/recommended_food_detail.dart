import 'package:e_commerceapp/controllers/cart_controller.dart';
import 'package:e_commerceapp/controllers/recommended_product_controller.dart';
import 'package:e_commerceapp/models/products_model.dart';
import 'package:e_commerceapp/utils/app_constant.dart';
import 'package:e_commerceapp/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../cart/cartPage.dart';
import '../home/main_food_page.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int foodId;
  final String page;

  const RecommendedFoodDetails({Key? key, required this.foodId , required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel productModel = Get.find<RecommendedProductController>().recommendedProductList[foodId];
    Get.find<RecommendedProductController>().initProduct(productModel, Get.find<CartController>());

    return Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 100,
              title: Row(
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
                  GetBuilder<RecommendedProductController>(builder: (RecmmProdController) {
                    return GestureDetector(
                        onTap: () {
                          RecmmProdController.totalItems >=1?Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()),
                          ) : print("nothing on cart");
                          // Get.to(()=>CartPage());
                        },
                        child: Stack(children: [
                         AppIcon(icon: Icons.shopping_cart_outlined),

                          RecmmProdController.totalItems >= 1 ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ))
                              : Container(),
                          RecmmProdController.totalItems >= 1
                              ? Positioned(
                                  right: 3,
                                  top: 3,
                                  child: BigText(
                                      text: Get.find<
                                              RecommendedProductController>()
                                          .totalItems
                                          .toString(),
                                      size: 12,
                                      color: Colors.white))
                              : Container(),
                        ]));
                  })
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                      child: BigText(size: 20, text: productModel.name!)),
                  // color: Colors.white,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                      )),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                AppConstant.BASE_URL + "/uploads/" + productModel.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ))),
          SliverToBoxAdapter(
              child: Column(children: [
            Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpendableTextWidget(
                  text: productModel.description.toString(),
                ))
          ])),
        ]),
        bottomNavigationBar: GetBuilder<RecommendedProductController>(
          builder: (recommProduct) {
            return Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width10,
                      top: Dimensions.height5,
                      bottom: Dimensions.height5),
                  padding: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width10,
                      top: Dimensions.height10,
                      bottom: Dimensions.height10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              recommProduct.setQuantity(false);
                            },
                            child: AppIcon(
                                icon: Icons.remove,
                                backgroundColor: AppColors.mainColor,
                                iconColor: Colors.white)),
                        SizedBox(width: Dimensions.width30),
                        BigText(
                            text:
                                "\$ ${productModel.price!} X  ${recommProduct.inCartItems.toString()}"),
                        SizedBox(width: Dimensions.width30),
                        GestureDetector(
                          onTap: () {
                            recommProduct.setQuantity(true);
                          },
                          child: AppIcon(
                              icon: Icons.add,
                              backgroundColor: AppColors.mainColor,
                              iconColor: Colors.white),
                        )
                      ]),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width10,
                      top: Dimensions.height20,
                      bottom: Dimensions.height15),
                  margin: EdgeInsets.only(),
                  decoration: BoxDecoration(
                    color: AppColors.bottomNavitionColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 65,
                            width: 60,
                            margin: EdgeInsets.only(left: Dimensions.height5),
                            child: AppIcon(
                                icon: Icons.favorite,
                                backgroundColor: Colors.white,
                                iconColor: AppColors.mainColor)),
                        SizedBox(width: Dimensions.width30),
                        GestureDetector(
                            onTap: () {
                              recommProduct.addItem(productModel);
                            },
                            child: Container(
                                width: 200,
                                height: 75,
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(right: Dimensions.height5),
                                padding: EdgeInsets.only(
                                    top: Dimensions.height10,
                                    bottom: Dimensions.height10,
                                    left: Dimensions.width10,
                                    right: Dimensions.width10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: AppColors.mainColor,
                                ),
                                child: BigText(
                                    text: "\$10.0 | Add to cart",
                                    color: Colors.white,
                                    size: 20)))
                      ]),
                ),
              ]),
            );
          },
        ));
  }
}
