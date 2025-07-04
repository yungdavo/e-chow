import 'package:e_Chow/base/custom_loader.dart';
import 'package:e_Chow/controllers/auth_controller.dart';
import 'package:e_Chow/controllers/cart_controller.dart';
import 'package:e_Chow/controllers/user_controller.dart';
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

    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
            text: "Profile", size: 24, color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController){
        if(!_userLoggedIn){
          return Center(
            child: Text("You must be logged in"));
        }else if(userController.isLoading){
          return const CustomLoader();
        }else if(userController.userModel == null){
          return Center(child: Text("Failed to load user data"));
        }


        return Container(
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
                            text: userController.userModel?.name??"N/A"
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
                            text:  userController.userModel?.phone??"N/A"
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
                            text:  userController.userModel?.email??"N/A"
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
        );
      }),
    );
  }
}
