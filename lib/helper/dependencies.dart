import 'package:e_Chow/controllers/auth_controller.dart';
import 'package:e_Chow/data/repository/auth_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/cart_controller.dart';
import '../controllers/popular_product_controllers.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';


Future <void> init() async {

    final sharedPreferences = await SharedPreferences.getInstance(); //created an instance to load it first

    Get.lazyPut(()=> sharedPreferences) ;
    //apiClient
    Get.lazyPut(()=>ApiClient(appBaseURL: AppConstants.BASE_URL));
    Get.lazyPut(()=> AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
    //repos
    Get.lazyPut(() => PopularProductRepo(apiClient:Get.find()));
    Get.lazyPut(() => RecommendedProductRepo(apiClient:Get.find()));
    Get.lazyPut(()=>  CartRepo(sharedPreferences:Get.find()));

    //controllers
    Get.lazyPut(()=>  AuthController(authRepo: Get.find()));
    Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
    Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find()));
    Get.lazyPut(() => CartController(cartRepo: Get.find()));
}