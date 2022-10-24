import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  //  ex: kanch...
  BigText({Key? key, this.color = const Color(0xFF332d2b),
    required this.text ,
    this.size=0,
    this.overFlow = TextOverflow.ellipsis

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines:1,
        overflow:overFlow,
        style:TextStyle(
        fontFamily:'Roboto',
        fontSize: size==0?Dimensions.font20:size,    // if size calling as zero then go with font20, otherwise size will given size when create widget
        color: color,
        fontWeight:FontWeight.w400,
    ),
    );
  }
}









