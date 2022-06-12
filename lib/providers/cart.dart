import 'package:flutter/foundation.dart';

class CartItems {
  final String id;
  final String title;
  final int quatity;
  final double price;

  CartItems({
    required this.id,
    required this.title,
    required this.quatity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  // ignore: prefer_final_fields
  Map<String, CartItems> _items = {};

  Map<String, CartItems> get items {
    return {..._items};
  }

  int get itemCount {
    // ignore: unnecessary_null_comparison
    return _items.length;
  }

  double get totalAmount{

    var total=0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quatity;
     });

    return total;
  }

  void addItem(String productId, double price, String title) {
    _items.update(
        productId,
        (value) => CartItems(
            id: value.id,
            title: value.title,
            quatity: value.quatity + 1,
            price: value.price),
        ifAbsent: () => CartItems(
              id: DateTime.now().toString(),
              title: title,
              quatity: 1,
              price: price,
            ));
            notifyListeners();
  }

  void removeItem( String productId){
    _items.remove(productId);
    notifyListeners();
  }
}
