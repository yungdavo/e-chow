import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/popular_product_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../utils/colors.dart';
import 'cart_controller.dart';

class PopularProductController extends GetxController{
    //GetxControllers are only for repo or api client
  //BEFORE WE INITIALIZE CONTROLLER, WE FIRST PASS REPO 

  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List <ProductModel> _popularProductList=[]; // this is to save data gotten from repo
  List <ProductModel> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded =>_isLoaded;

  int _quantity = 0;
  int get quantity => _quantity ;

  int _inCartItems= 0;
  int get inCartItems => _inCartItems + _quantity ;


  Future<void> getPopularProductList() async {
    try {
      _popularProductList = await popularProductRepo.getPopularProductList();
      _isLoaded = true;
      update();
    } catch (e) {
      print("Couldn't get products: $e");
    }
  }



  void setQuantity (bool isIncrement){
    //responsible for increasing and decreasing the number of items to be added
    if (isIncrement){
      print("Increment"+_quantity.toString());
        _quantity = checkQuantity(_quantity + 1);
    }else{
      print("decrease"+_quantity.toString());
        _quantity = checkQuantity(_quantity - 1);
    }
     update();
  }

  int checkQuantity(int quantity){
    if (( _inCartItems + quantity)<0){
      Get.snackbar("Oops!", "you no fit go lower",
      backgroundColor: AppColors.mainColor,
        colorText: Colors.black,
      );
      if (_inCartItems>0){
        _quantity = - _inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity)>20){
      Get.snackbar("Oops!", "you no fit go Higher",
      backgroundColor: AppColors.mainColor,
          colorText: Colors.black,);
      return 20;
    }else {
      return quantity;
    }
  }

  void  initProduct(ProductModel product,CartController cart){
      _quantity = 0 ;
      _inCartItems = 0; // for saving items in cart
      _cart = cart;
      var exist = false;
      exist = _cart.existInCart(product);
      //print("exist or not" + exist.toString());
      if (exist){
        _inCartItems=_cart.getQuantity(product);
      }
      //print("the quantity in the cart is" +_inCartItems.toString());
  }

  void addItem (ProductModel product){
    // if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        //print("The id is "+value.id.toString()+" The quantity is "+value.id.toString());
      });
    // } else {
    //   Get.snackbar("Oops!", "you never add any item",
    //     backgroundColor: AppColors.mainColor,
    //     colorText: Colors.black);
    // }
    update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

   List<CartModel> get getItems{
    return _cart.getItems;
   }
}