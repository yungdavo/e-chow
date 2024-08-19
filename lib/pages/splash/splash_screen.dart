import 'dart:async';
import 'package:e_Chow/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controllers.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

 Future <void> _loadResources()async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  
  @override
  void initState(){
    super.initState();
    _loadResources();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3)
    )..forward();
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear
    );
    Timer(
        const Duration(seconds: 4),
        ()=>Get.offNamed(
            RouteHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: animation,
                child: Center(
                    child: Image.asset(
                      "assets/images/logo part 1.png",
                      width: Dimensions.splashImg,
                    ),
                ),
              ),
              Center(
                  child: Image.asset(
                    "assets/images/logo part 2.png",
                    width: Dimensions.splashImg,
                  ),
              ),
            ],
          ),
    );
  }
}
