import 'package:e_Chow/controllers/auth_controller.dart';
import 'package:e_Chow/controllers/cart_controller.dart';
import 'package:e_Chow/routes/route_helper.dart';
import 'package:e_Chow/utils/colors.dart';
import 'package:e_Chow/utils/dimensions.dart';
import 'package:e_Chow/widgets/account_widget.dart';
import 'package:e_Chow/widgets/app_icon.dart';
import 'package:e_Chow/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
            text: "Profile", size: 24, color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45+Dimensions.height30,
              size: Dimensions.height15*10,
            ),
            SizedBox(height: Dimensions.height30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                      bigText: BigText(
                          text: "David"
                      ),
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    AccountWidget(
                      bigText: BigText(
                          text: "+2347038956453"
                      ),
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    AccountWidget(
                      bigText: BigText(
                          text: "davejoe1510@yahoo.com"
                      ),
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    AccountWidget(
                      bigText: BigText(
                          text: "Scc Road"
                      ),
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    AccountWidget(
                      bigText: BigText(
                          text: "Message"
                      ),
                      appIcon: AppIcon(
                        icon: Icons.message,
                        backgroundColor: Colors.green,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    GestureDetector(
                      onTap: (){
                        if (Get.find<AuthController>().userLoggedIn()){
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSignInPage());
                        }else{
                          print("Logged out");
                        }
                      },
                      child: AccountWidget(
                        bigText: BigText(
                            text: "Sign Out"
                        ),
                        appIcon: AppIcon(
                          icon: Icons.logout,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
