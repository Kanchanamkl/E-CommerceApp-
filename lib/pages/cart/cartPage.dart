import 'package:e_commerceapp/controllers/cart_controller.dart';
import 'package:e_commerceapp/pages/food/popular_food_detail.dart';
import 'package:e_commerceapp/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
            AppIcon(
                icon: Icons.arrow_back_ios,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                size: Dimensions.iconSize24),
            SizedBox(width: Dimensions.width20 * 5),
            AppIcon(
                icon: Icons.home_outlined,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                size: Dimensions.iconSize24),
            GestureDetector(
              onTap:(){
                Get.to(()=> MainFoodPage());
              },
              child: AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  size: Dimensions.iconSize24),
            ),
          ])),
      Positioned(
          top: Dimensions.height20 * 5,
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: 0,
          child: Container(
              //color: Colors.lightGreenAccent,
              margin:EdgeInsets.only(top: Dimensions.height10),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController){
                  return ListView.builder(
                      itemCount: cartController.getItemList.length,
                      itemBuilder: (_, index) {
                        return Container(
                            height: 100,
                            width: double.infinity,

                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                    width: Dimensions.height20 * 5,
                                    height: Dimensions.height20 * 5,
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height5),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              AppConstant.BASE_URL+"/uploads/"+cartController.getItemList[index].img!),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        color: Colors.white)),
                                SizedBox(width:Dimensions.width10),
                                Expanded(child: Container(
                                    height: Dimensions.height20*5,
                                    child: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                        children:[
                                          BigText(text:cartController.getItemList[index].name.toString() , color: Colors.black54),
                                          SmallText(text: "Spicy"),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                BigText(text:cartController.getItemList[index].price.toString() ,color: Colors.redAccent,),
                                                Container(
                                                    width: 70,
                                                    height: 40,
                                                    margin: EdgeInsets.only(right:Dimensions.height5),
                                                    padding: EdgeInsets.only(right:Dimensions.height5),
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
                                                                //popularProduct.setQuantity(false);
                                                              },
                                                              child: Icon(Icons.remove,
                                                                  color: AppColors.signColor)),
                                                          BigText(
                                                              text:"0"// popularProduct.inCartItems.toString()
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                // popularProduct.setQuantity(true);
                                                              },
                                                              child: Icon(Icons.add,
                                                                  color: AppColors.signColor)),
                                                        ])),
                                              ]
                                          )
                                        ]
                                    )
                                ))
                              ],
                            ));
                      });
                }),
              )))
    ]));
  }
}
