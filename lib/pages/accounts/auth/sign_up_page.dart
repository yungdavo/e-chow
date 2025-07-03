import 'package:e_Chow/base/custom_loader.dart';
import 'package:e_Chow/base/show_custom_snackbar.dart';
import 'package:e_Chow/controllers/auth_controller.dart';
import 'package:e_Chow/models/sign_up_model.dart';
import 'package:e_Chow/utils/colors.dart';
import 'package:e_Chow/widgets/app_text_field.dart';
import 'package:e_Chow/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var SignUpImages = [
      "t.png",
      "f.png",
      "g.png"
    ];

    void _registration(AuthController authController){

      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty){
        showCustomSnackBar("Enter your name", title: "Name");
      }else if(phone.isEmpty){
        showCustomSnackBar("Enter your phone number", title: "Phone Number");
      }else if (email.isEmpty){
        showCustomSnackBar("Enter your email address", title: "Email Address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Please a valid email address", title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Enter your password", title: "Password");
      }else if(password.length<6){
        showCustomSnackBar("Please enter not less than six characters", title: "password");
      }else{

        SignUpModel signUpModel = SignUpModel(
            name: name,
            phone: phone,
            email: email,
            password: password
        );
          authController.registration(signUpModel).then((status){
            if (status.isSuccess){
              print("Account created successfully");
            }else{
              showCustomSnackBar(status.message);
            }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
          return !_authController.isLoading? SingleChildScrollView(
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
                AppTextField(
                  textEditingController: emailController,
                  hintText: "Email",
                  iconData: Icons.email,
                ),
                SizedBox(height: Dimensions.height20),
                AppTextField(
                  textEditingController: passwordController,
                  hintText: "Password",
                  iconData: Icons.lock, isObscure:true
                ),
                SizedBox(height: Dimensions.height20),
                AppTextField(
                  textEditingController: nameController,
                  hintText: "Name",
                  iconData: Icons.person,
                ),
                SizedBox(height: Dimensions.height20),
                AppTextField(
                  textEditingController: phoneController,
                  hintText: "Phone",
                  iconData: Icons.phone,
                ),
                SizedBox(height: Dimensions.height20+Dimensions.height20),
                GestureDetector(
                  onTap: (){
                    _registration(_authController);
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
                        text: "Sign Up",
                        size: Dimensions.font20+Dimensions.font20/2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height10),
                RichText(
                    text:TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap=()=>Get.back(),
                      text: "Have an account already?",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20,
                      ),
                    )
                ),
                SizedBox(height: Dimensions.screenHeight*0.05),
                //Sign up options
                RichText(
                    text:TextSpan(
                      text: "Sign Up with your socials",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font16,
                      ),
                    )
                ),
                Wrap(
                  children: List.generate(
                      3, (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: Dimensions.radius30,
                      backgroundImage: AssetImage(
                          "assets/images/" + SignUpImages[index]
                      ),
                      ),
                    )
                  ),
                )
              ],
            ),
          )
              :CustomLoader();
      })
    );
  }
}
