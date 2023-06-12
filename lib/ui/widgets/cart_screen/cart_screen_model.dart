// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:test_app/domain/local_storage/local_storage_service.dart';

import '../../../domain/entity/cart_items.dart';
import '../../../domain/entity/dishes.dart';

class CartScreenModel extends ChangeNotifier {
  final _localStorage = LocalStorageService();
  Box<CartItems>? _box;
  CartScreenModel() {
    _init();
  }

  Future<void> _init() async {
    final Box<CartItems> box = await _localStorage.getBox();
    _box = box;
    notifyListeners();
  }

  Future<void> addDish(Dish dish) async {
    await _localStorage.saveItem(dish);
  }

  Future<void> removeDish(Dish dish) async {
    await _localStorage.deleteItem(dish);
  }

  Box<CartItems>? get box => _box;

  int getTotalAmount(cartItems) {
    final cartItems = box!.values.toList();
    var totalAmount = 0;
    for (var element in cartItems) {
      totalAmount += element.count * element.item.price;
    }
    return totalAmount;
  }
}
