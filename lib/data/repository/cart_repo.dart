import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo ({required this.sharedPreferences});

  List<String> cart =[];
  void addToCartList(List <CartModel> cartList){
      cart = [];
      /**
       * converts object(CartModel) to string because shared-preferences only accepts string
       * */
      cartList.forEach((element) {
        cart.add(jsonEncode(element)
        );
      });
      sharedPreferences.setStringList("Cart-List", cart);
      print(sharedPreferences.getStringList("Cart-List"));
  }
}