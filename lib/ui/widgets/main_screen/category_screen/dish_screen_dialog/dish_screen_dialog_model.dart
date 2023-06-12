// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:test_app/domain/local_storage/local_storage_service.dart';

import '../../../../../domain/entity/dishes.dart';


class DishScreenDialogModel extends ChangeNotifier {
  final Dish dish;
  final _localStorage = LocalStorageService();
  DishScreenDialogModel({
    required this.dish,
  });
  Future<void> addCart() async {
    await _localStorage.saveItem(dish);
  }

  void removeDishFromCart() {
   
  }
}
