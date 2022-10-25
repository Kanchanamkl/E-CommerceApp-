import 'package:e_commerceapp/pages/home/food_page_body.dart';
import 'package:e_commerceapp/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:e_commerceapp/utils/colors.dart';
import 'package:e_commerceapp/widgets/big_text.dart';
import 'package:e_commerceapp/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is "+ MediaQuery.of(context).size.height.toString());
    print("current width is "+ MediaQuery.of(context).size.width.toString());
    print(Dimensions.pageView);


    return Scaffold(

      body: Column(
        children: [

          Container(

            child: Container(

              margin: const EdgeInsets.only(top: 40 , bottom: 5),
              padding: EdgeInsets.only(left: 20 , right: 20  ),

                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:  [
                        BigText(text:"Sri Lanka", color: AppColors.mainColor,size:30),
                        Row(
                          children: [
                            SmallText(text: "Colombo" , color: AppColors.mainBlackColor),
                            const Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                          width: Dimensions.height45,
                          height: 45,
                          child:Icon(Icons.search, color:Colors.white, size:Dimensions.iconSize24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.mainColor,
                          )
                      ),
                    )
                  ],
                )
            )
        ),
        Expanded(

          child: const SingleChildScrollView(
            child: FoodPageBody(
            ),
          ),
        ),

        ]
      ),
    );
  }
}
