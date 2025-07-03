import 'package:e_Chow/controllers/auth_controller.dart';
import 'package:e_Chow/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'package:get/get.dart';


class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    print("Loading state"+Get.find<AuthController>().toString());
    return Center(
      child: Container(
        height: Dimensions.height20*5,
        width: Dimensions.width20*5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20*5/2),
          color: AppColors.mainColor,
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
