import 'package:flutter/material.dart';

import '../../../../domain/api_client/api_client.dart';
import '../../../../domain/entity/dishes.dart';

class CategoryScreenModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _dishes = <Dish>[];
  final _tags = <String>[];
  List<Dish> _showDishList = [];

  Future<void> _getDishes() async {
    final dishes = await _apiClient.getDishes();
    final tags = <String>{};
    _dishes.addAll(dishes);
    _showDishList = dishes;
    for (var dish in _dishes) {
      tags.addAll((dish.tegs));
    }
    _tags.addAll(tags);
    notifyListeners();
  }

  void changeShowDishList([int value = 0]) {
    if (value == 0) {
      _showDishList = _dishes;
    }
    final showListDish = <Dish>[];
    final tag = tags[value];
    for (Dish dish in _dishes) {
      if (dish.tegs.contains(tag)) {
        showListDish.add(dish);
      }
    }
    _showDishList = showListDish;
    notifyListeners();
  }

  Dish getDish(int value) {
    return _showDishList[value];
  }

  List<Dish> get showDishList => _showDishList;

  List<String> get tags => _tags;

  CategoryScreenModel() {
    _getDishes();
  }
}
