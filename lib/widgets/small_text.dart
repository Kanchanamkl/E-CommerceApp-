import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  //TextOverflow overFlow;  //  ex: kanch...
  SmallText({Key? key, this.color =const Color(0xff999797),
    required this.text ,
    this.size=12,
    this.height= 1.2,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style:TextStyle(
        fontFamily:'Roboto',
        fontSize: size,
        color: color,
        height: height,

      ),
    );
  }
}










