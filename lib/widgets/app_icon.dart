import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const AppIcon({Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),// we pass this as a constant BG color
    this.iconColor = const Color(0xFF756d54),// we pass this as a constant color
    this.size = 40, //we'll set a constant icon size
    this.iconSize=16
    // we are setting a constant color because we can't import from our app color here
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize24,
      ),
    );
  }
}
