import 'package:e_commerceapp/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Column(

            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              SizedBox(height: Dimensions.height20),
              BigText(text: "Chinese Side" , size: 26 ),
              SizedBox(height: Dimensions.height10),
              Row(
                  children:[
                    Wrap( // design same thing again and again
                      children:List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size:15)),
                    ),
                    SizedBox(width:Dimensions.width15,),
                    SmallText(text: "4.5"),
                    SizedBox(width:Dimensions.width15,),
                    SmallText(text: "1245"),
                    SizedBox(width:Dimensions.width15,),
                    SmallText(text: "comments")

                  ]
              ),
              SizedBox(height:Dimensions.height15,),
              Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children:[
                    IconAndTextWidget(
                      icon:      Icons.circle_sharp,
                      text:      "Normal",
                      iconColor: AppColors.iconColor1,
                    ),
                    SizedBox(width: Dimensions.width15,),
                    IconAndTextWidget(

                      icon:      Icons.location_on_sharp,
                      text:      "1.7 km",
                      iconColor: AppColors.mainColor,
                    ),
                    SizedBox(width:  Dimensions.width15,),
                    IconAndTextWidget(
                      icon:      Icons.access_time,
                      text:      "32 min",
                      iconColor: AppColors.iconColor2,
                    )
                  ]
              ),
              SizedBox(height: Dimensions.height20),


            ]

        )
    );
  }
}
