import 'dart:convert';
import 'package:e_Chow/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo ({required this.sharedPreferences});

  List <String> cart =[];
  List <String> cartHistory =[];

  void addToCartList(List <CartModel> cartList){
      //sharedPreferences.remove(AppConstants.CART_LIST);
      //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
      var time = DateTime.now().toString();
      cart = [];
      /**
       * converts object(CartModel) to string because shared-preferences only accepts string
       * */
      cartList.forEach((element) {

        element.time = time;

        return cart.add(jsonEncode(element)
        );
      });

      /*cartList.forEach((element) => cart.);*/

      sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
      //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    //getCartList();
  }

  List <CartModel> getCartList(){
    List<String> carts=[];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){

      cart = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }

    List<CartModel> cartList =[];

    carts.forEach((element) =>cartList.add(CartModel.fromJson(jsonDecode(element)
        )
      )
    );
    return cartList;
  }

  List <CartModel> getCartHistoryList(){
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List <CartModel> cartListHistory = [];

    cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    
    return cartListHistory;
  }

  void addToCartHistoryList(){

    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
        for (int i=0; i<cart.length; i++){
          cartHistory.add(cart[i]);
        }
        removeCart();
        sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);

        for (int j=0; j<getCartHistoryList().length; j++){

        }
  }

  void removeCart(){
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  void clearCartHistory(){
    removeCart();
    cartHistory=[];
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }

}