import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerceapp/models/products_model.dart';
import 'package:e_commerceapp/pages/food/popular_food_detail.dart';
import 'package:e_commerceapp/pages/food/recommended_food_detail.dart';
import 'package:e_commerceapp/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:e_commerceapp/utils/colors.dart';
import 'package:e_commerceapp/widgets/big_text.dart';
import 'package:e_commerceapp/widgets/icon_and_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constant.dart';
import '../../widgets/small_text.dart';
import 'package:e_commerceapp/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print("current value is "+ _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose(); // release memory after leave the current page
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(builder: ( PopularProductController popularProducts) {
          return popularProducts.isLoaded? Container(
            //color:Colors.white70,
            // color: Colors.cyanAccent,
              height: 320,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position ,popularProducts.popularProductList[position]);
                  })):CircularProgressIndicator(
            color: AppColors.mainColor,


          );
        }),
        SizedBox(
          height: Dimensions.height10,
        ),
        //dots
       GetBuilder<PopularProductController>(builder:(popularProducts) {
        return  DotsIndicator(
           dotsCount: popularProducts.popularProductList.isEmpty?5:popularProducts.popularProductList.length,
           position: _currPageValue,
           decorator: DotsDecorator(
             activeColor: AppColors.mainColor,
             size: const Size.square(9.0),
             activeSize: const Size(18.0, 9.0),
             activeShape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(5.0)),
           ),
         );
       }),
        SizedBox(
          height: Dimensions.height15,
        ),
        //Popular text

         Container(
              margin: EdgeInsets.only(left: Dimensions.width30),
              child: Row(
                //crossAxisAlignment:CrossAxisAlignment.end,
                children: [
                  BigText(text: "Recommended"),
                  SizedBox(width: Dimensions.width10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: BigText(text: ".", color: Colors.black26),
                  ),
                  SizedBox(width: Dimensions.width10),
                  Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: SmallText(text: "Food pairing"))
                ],
              )),

        SizedBox(
          height: Dimensions.height10,
        ),
        // list of food and images

    GetBuilder<RecommendedProductController>(builder:( RecommendedProductController recommendedProducts){
        return recommendedProducts.isLoaded? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProducts.recommendedProductList.length,
            itemBuilder: (context, index) {
              ProductModel recommendedProduct = recommendedProducts.recommendedProductList[index];
              return GestureDetector(
                onTap:(){

                  Get.toNamed(RouteHelper.getRecommendedFood(index ,"home"));


                },
                child: Container(


                    //color:Colors.cyanAccent,
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height5),
                    child: Row(
                      children: [
                        // image section
                        Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white38,
                              image:  DecorationImage(
                                image: NetworkImage(AppConstant.BASE_URL+"/uploads/"+recommendedProduct.img!),
                              ),
                            )),
                        //text section
                        Expanded(
                          child: Container(
                            height: 100,
                            // width:200,
                            //color: Colors.cyanAccent,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight: Radius.circular(Dimensions.radius20),
                                bottomLeft: Radius.circular(10),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xFFe8e8e8),
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)),
                                BoxShadow(
                                    color: Colors.white, offset: Offset(5, 0)),
                              ],
                            ),

                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: Dimensions.width10),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                        text: recommendedProduct.name!,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      SmallText(
                                          text: "With Sri Lankan recepies "),
                                      SizedBox(
                                        height: Dimensions.height15,
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IconAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor: AppColors.iconColor1,
                                            ),
                                            SizedBox(
                                              width: Dimensions.width5,
                                            ),
                                            IconAndTextWidget(
                                              icon: Icons.location_on_sharp,
                                              text: "1.7 km",
                                              iconColor: AppColors.mainColor,
                                            ),
                                            SizedBox(
                                              width: Dimensions.width5,
                                            ),
                                            IconAndTextWidget(
                                              icon: Icons.access_time,
                                              text: "32 min",
                                              iconColor: AppColors.iconColor2,
                                            )
                                          ]),
                                    ])),
                          ),
                        )
                      ],
                    )),
              );
            }):CircularProgressIndicator(
          color: AppColors.mainColor,


        );
    })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap:(){
              Get.toNamed(RouteHelper.getPopularFood(index, "home"));
            },
            child: Container(
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width5, right: Dimensions.width5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: index.isEven ? Color(0xFF69C5DF) : Color(0xFFffd379),
                    image:  DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            AppConstant.BASE_URL+"/uploads/"+popularProduct.img!
                        )))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height10),
                padding: EdgeInsets.only(top: Dimensions.height5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ],
                ),
                child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        left: Dimensions.width10,
                        right: Dimensions.width10,
                        bottom: Dimensions.height10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: popularProduct.name!),
                          SizedBox(height: Dimensions.height10),
                          Row(children: [
                            Wrap(
                              // design same thing again and again
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      color: AppColors.mainColor, size: 15)),
                            ),
                            SizedBox(
                              width: Dimensions.width15,
                            ),
                            SmallText(text: "4.5"),
                            SizedBox(
                              width: Dimensions.width15,
                            ),
                            SmallText(text: "1245"),
                            SizedBox(
                              width: Dimensions.width15,
                            ),
                            SmallText(text: "comments")
                          ]),
                          SizedBox(
                            height: Dimensions.height15,
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: "Normal",
                                  iconColor: AppColors.iconColor1,
                                ),
                                SizedBox(
                                  width: Dimensions.width15,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on_sharp,
                                  text: "1.7 km",
                                  iconColor: AppColors.mainColor,
                                ),
                                SizedBox(
                                  width: Dimensions.width15,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.access_time,
                                  text: "32 min",
                                  iconColor: AppColors.iconColor2,
                                )
                              ]),
                        ]))),
          ),
        ],
      ),
    );
  }
}
