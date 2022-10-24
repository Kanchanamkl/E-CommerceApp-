import 'package:e_commerceapp/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../home/main_food_page.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Center(child: BigText(size: 20, text: "Chinese Side")),
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
                background: Image.asset(
              "assets/image/food0.png",
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
                  text:
                      "This is a tuna cassele that even my picky family loves! The potato chips gThis is a tuna casserole that even my even my picky family loves! The potato chips gThis is a tuna casserole that even myeven my picky family loves! The potato chips gThis is a tuna casserole that even my picky famieven my picky family loves! The potato chips gThis is a tuna casserole that even my picky famieven my picky family loves! The potato chips gThis is a tuna casserole that even my picky fami picky fami picky family loves! The potato chips give the casserole a crunchy crust.This is a tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust.This is a tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust.This is a tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust.tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust.tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust.tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust.tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust.tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust.tuna casserole that even my picky family loves! The potato chips give the casserole a crunchy crust."))
        ])),
      ]),
      bottomNavigationBar: Container(
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
              AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white),
              SizedBox(width: Dimensions.width30),
              BigText(text: "\$12.88 X 0"),
              SizedBox(width: Dimensions.width30),
              AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white)
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
      ),
    );
  }
}
