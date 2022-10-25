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
import '../home/main_food_page.dart';

class RecommendedFoodDetails extends StatelessWidget {
   final int foodId;
   const RecommendedFoodDetails({Key? key, required this.foodId }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Get.find<RecommendedProductController>().initProduct();
    ProductModel recommFood = Get.find<RecommendedProductController>().recommendedProductList[foodId];



    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
            toolbarHeight: 100,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children:  [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
          },
                    child: AppIcon(icon: Icons.arrow_back_ios_new)),
                AppIcon(icon: Icons.shopping_cart_outlined)

              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size: 20, text:recommFood.name!)),
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
                  AppConstant.BASE_URL+"/uploads/"+recommFood.img!,
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
                  text:recommFood.description.toString(),
              ))])),
      ]),
      bottomNavigationBar:GetBuilder<RecommendedProductController>(builder:(recommProduct){

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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                onTap:(){
            recommProduct.setQuantity(false);


            },
             child: AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white)),
              SizedBox(width: Dimensions.width30),
              BigText(text: "\$ ${recommFood.price!} X  ${ recommProduct.quantity.toString()}"),
              SizedBox(width: Dimensions.width30),
              GestureDetector(
                onTap:(){
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
                  Container(
                      width: 200,
                      height: 75,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: Dimensions.height5),
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
                      child: BigText(
                          text: "\$10.0 | Add to cart",
                          color: Colors.white,
                          size: 20))
                ]),
          ),
        ]),
      );},
    ));
  }
}
