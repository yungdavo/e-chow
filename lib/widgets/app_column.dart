import 'package:e_Chow/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        BigText(text: text, size: Dimensions.font26,),//makes the title text bigger
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) =>
              Icon(Icons.star, color: AppColors.mainColor,
                  size: 15,),
                  ),
                ),
              SizedBox(width: Dimensions.width10,),
              SmallText(text: "4.5"),
              SizedBox(width: Dimensions.width10,),
              SmallText(text: "4083"),
              SizedBox(width: 2,),
              SmallText(text: "comments"),
                ],
            ),
              SizedBox(height: Dimensions.height10,),
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  IconAndTextWidget(icon: Icons.circle_sharp,
                      text:"Normal",
                      iconColor: AppColors.iconColor1),
                  SizedBox(width: Dimensions.width10,),
                  IconAndTextWidget(icon: Icons.location_pin,
                      text: "1.7km",
                      iconColor:AppColors.mainColor),
                  SizedBox(width:Dimensions.width10,),
                  IconAndTextWidget(icon: Icons.access_time_rounded,
                      text: "12mins",
                      iconColor:AppColors.iconColor2),
                ],
              ),
            ],
    );
  }
}
