import 'package:flutter/foundation.dart';

class CartItem {
  final String cartId;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.cartId,
    @required this.productId,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });

}

class Cart with ChangeNotifier{

  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

}