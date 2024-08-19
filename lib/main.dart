import 'package:e_Chow/pages/Cart/cart_page.dart';
import 'package:e_Chow/pages/home/food_page_body.dart';
import 'package:e_Chow/pages/home/main_food_page.dart';
import 'package:e_Chow/pages/splash/splash_screen.dart';
import 'package:e_Chow/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/popular_product_controllers.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // to make sure we wait for our dependencies load correctly
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //home: SplashScreen( ),
          //home: MainFoodPage(),
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}

