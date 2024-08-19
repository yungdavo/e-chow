import 'package:e_Chow/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import '../utils/dimensions.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget({super.key,
    required this.icon,
    required this.text,

    required this.iconColor});
  final IconData icon;
  final String text;

  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(icon, color: iconColor,
        size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text),
        ],
    );
  }
}
