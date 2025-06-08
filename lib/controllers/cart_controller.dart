import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};//to save data in app when we are using the data

  Map<int, CartModel> get items => _items;

  /*
  only for storage and shared preferences
 */
  
  List<CartModel> storageItems=[];

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) { //this model updates the list

        totalQuantity = value.quantity!+quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          //first quantity will added to the new quantity
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if (totalQuantity <= 0){
        _items.remove(product.id);
      }

    } else {
      //print("Length of the item in cart is " +_items.length.toString());
      if (quantity > 0 ){
        _items.putIfAbsent(
            product.id!, () //to check to avoid adding duplicate items
        {
          //print("Item added to cart id" + product.id!.toString()+ "quantity" + quantity.toString());
          //_items.forEach((key, value) { //to show quantity of each item added
          //print("quantity is " +value.quantity.toString() );});
          return CartModel( // this model adds it to the list
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
            );
          }
        );
      }else{
        Get.snackbar("Oops!", "you never add any item",
            backgroundColor: AppColors.mainColor,
            colorText: Colors.black
        );
      }
    }

    cartRepo.addToCartList(getItems);

    update();
  } // add and update items to cart

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }//lets us know if an item exists or not

  int getQuantity(ProductModel product){
    var quantity = 0;
    if (_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key==product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  } // total amount of items in cart

  int get totalItems{
      var totalQuantity=0;
        _items.forEach((key, value) {
          totalQuantity += value.quantity!; // long form totalQuantity + totalQuantity = value.quantity!;
        });
      return totalQuantity;
  } //to show the number of items on the cart icon

  List<CartModel> get getItems{
    return _items.entries.map((e){
       return e.value;
    }).toList();
  } // to display list of items in the cart page

  int get totalAmount{
    var total = 0;
      _items.forEach((key, value) {
        total += value.quantity!*value.price!;
      });
    return total;
  } // to get total amount for items in cart

  List<CartModel> getCartData(){

    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items){
    storageItems = items;
    
    for(int i=0; i<storageItems.length; i++){
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory(){
     cartRepo.addToCartHistoryList();
     clear();
  }

  void clear(){
    _items = {};
    update();
  }

  List <CartModel> getCartHistoryList(){

    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems){
      _items = {};
    _items = setItems;
  }

  void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();
  }

}
