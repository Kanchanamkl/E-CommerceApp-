import 'package:e_commerceapp/utils/dimensions.dart';
import 'package:e_commerceapp/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ExpendableTextWidget extends StatefulWidget {
  final String text;

  const ExpendableTextWidget({Key? key,
    required this.text,

  }) : super(key: key);

  @override
  State<ExpendableTextWidget> createState() => _ExpendableTextWidgetState();
}

class _ExpendableTextWidgetState extends State<ExpendableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight= Dimensions.screenHeight/4;

  @override
  void initState(){
    super.initState();
    if(widget.text.length> textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1 , widget.text.length);
    }else{
      firstHalf= widget.text;
      secondHalf ="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color:AppColors.paraColor ,text: firstHalf, size:15):Column(
        children:[
          SmallText(color:AppColors.paraColor ,text: hiddenText?(firstHalf+"..."):(firstHalf+ secondHalf) , size:15 , height: 1.4,),
          InkWell(
            onTap:(){
              setState(() {
                hiddenText = !hiddenText;

              });

            },
            child: Row(
              children: [
                SmallText(text: "Show more" , color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color:AppColors.mainColor),
              ],
            )
          )
        ]
      ),
    );
  }
}
