import 'package:get/get.dart';
class Dimensions{

  //screenHeight 890.3

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/2.79; //screenheight /container size
  static double pageViewContainer = screenHeight/4.04; //screenheight /container size
  static double pageViewTextContainer = screenHeight/7.41;//screenheight / text size

  //dynamic height padding and margin
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/59.3;
  static double height20 = screenHeight/44.5;
  static double height30 = screenHeight/44.5;
  static double height45 = screenHeight/19.7;
  static double height55 = screenHeight/16.8;

  //dynamic width padding and margin
  static double width2 =  screenHeight/445;
  static double width10 = screenHeight/84.4;
  static double width15 = screenHeight/59.3;
  static double width20 = screenHeight/44.5;
  static double width30 = screenHeight/29.7;
  static double width45 = screenHeight/19.7;

  //font size
  static double font16 = screenHeight/55.6;
  static double font20 = screenHeight/44.5;
  static double font26 = screenHeight/34.2;

  //dynamic radius //this part handles the curved edges
  static double radius15 = screenHeight/59.3;
  static double radius20 = screenHeight/44.5;
  static double radius30 = screenHeight/29.7;

  //icon size
  static double iconSize24 = screenHeight/37.1;   //default icon size for flutter is 24
  static double iconSize16 = screenHeight/55.6;   //16 is the default size we gave it

  //list view size
  static double listViewImgSize = screenWidth/3.42;  //screen width divides the default container size
  static double listViewTextContSize = screenWidth/4.11; //screen width divides the default container size

  static double popularFoodImgSize = screenHeight/2.5;

  //bottom bar height
  static double bottomHeightBar = screenHeight/7.14;

  //splash screen dimension
  static double splashImg = screenHeight/3.38;
}



