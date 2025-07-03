import 'package:e_Chow/widgets/big_text.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'app_icon.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;

  AccountWidget({super.key, required this.bigText, required this.appIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        top: Dimensions.width10,
        bottom: Dimensions.width15,
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width:Dimensions.width20),
          bigText,
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0,2),
            color: Colors.grey.withOpacity(0.2),
          ),
        ]
      ),
    );
  }
}
