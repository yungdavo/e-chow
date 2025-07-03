import 'package:e_Chow/pages/Cart/cart_page.dart';
import 'package:e_Chow/pages/accounts/auth/sign_in_page.dart';
import 'package:e_Chow/pages/splash/splash_screen.dart';
import 'package:get/get.dart';
import '../pages/food/popular_food_detail.dart';
import '../pages/food/recommended_food_detail.dart';
import '../pages/home/home_page.dart';



class RouteHelper{
  static const String splashScreen = "/splash-screen";
  static const String initial = "/"; //refers to the home page
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-In";

  //Activate transition effects
  static String getSplashScreen()=> '$splashScreen';
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId, String page)=> '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page)=> '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=> '$cartPage';
  static String getSignInPage()=> '$signIn';


  static List<GetPage> routes=[


    GetPage(
        name: splashScreen,
        page: ()=>SplashScreen()
    ),


    GetPage(
        name: initial,
        page: ()=>HomePage(),
    ),

    GetPage(
      name: initial,
      page: ()=>HomePage(),
    ),

    GetPage(
      name: signIn,
      page: ()=>SignInPage(),
        transition: Transition.fade
    ),

    GetPage(
        name: popularFood,
        page:(){
      var pageId=Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return PopularFoodDetail(
          pageId:int.parse(pageId!),page : page!
      );
    },
      transition: Transition.fadeIn //can be changed anytime
    ),

    GetPage(
        name: recommendedFood,
        page:(){
      var pageId=Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return RecommendedFoodDetail(
          pageId:int.parse(pageId!),page:page!
      );
    },
        transition: Transition.fadeIn //can be changed anytime
    ),
    GetPage(
        name: cartPage,
        page: ()=> CartPage(),
      transition: Transition.fadeIn
        )
  ];
}