import 'package:flutter/cupertino.dart';

//re-useable Small Text widget

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({Key? key, this.color = const Color(0xFFccc7c5),
    required this.text,
    this.height=1.2,
    this.size=14,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          height: height,
      ),
    );
  }
}
