import 'package:e_Chow/controllers/cart_controller.dart';
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
    Get.find<CartController>().getCartData();
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

