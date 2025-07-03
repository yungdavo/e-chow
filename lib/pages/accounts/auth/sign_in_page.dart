import 'package:e_Chow/base/custom_loader.dart';
import 'package:e_Chow/pages/accounts/auth/sign_up_page.dart';
import 'package:e_Chow/routes/route_helper.dart';
import 'package:e_Chow/utils/colors.dart';
import 'package:e_Chow/widgets/app_text_field.dart';
import 'package:e_Chow/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/show_custom_snackbar.dart';
import '../../../controllers/auth_controller.dart';
import '../../../utils/dimensions.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController){


      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty){
        showCustomSnackBar("Enter your email address", title: "Email Address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Please a valid email address", title: "Oops!");
      }else if(password.isEmpty){
        showCustomSnackBar("Enter your password", title: "Password");
      }else if(password.length<6){
        showCustomSnackBar("Please enter not less than six characters", title: "password");
      }else{

        authController.login(email, password).then((status){
          if (status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                  height: Dimensions.screenHeight*0.05
              ),
              Container(
                height: Dimensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage(
                      "assets/images/logo part 1.png",
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:Dimensions.width20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: Dimensions.font20*3+Dimensions.font20/2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign into your account",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Colors.grey[500],
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              AppTextField(
                textEditingController: emailController,
                hintText: "Email",
                iconData: Icons.email,
              ),
              SizedBox(height: Dimensions.height10),
              AppTextField(
                textEditingController: passwordController,
                hintText: "Password",
                iconData: Icons.lock, isObscure: true,
              ),
              SizedBox(height: Dimensions.screenHeight*0.05),
              GestureDetector(
                onTap:(){
                  _login(authController);
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor
                  ),
                  child: Center(
                    child: BigText(
                      text: "Sign In",
                      size: Dimensions.font20+Dimensions.font20/2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight*0.05),
              //Sign up options
              RichText(
                text:TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: Dimensions.font20,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap=()=>Get.to(()=>SignUpPage(),
                              transition: Transition.fade
                          ),
                        text: " Create",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        )
            :CustomLoader();
      }
      )
    );
  }
}
