import 'package:flutter/material.dart';
import 'package:test_app/domain/api_client/api_client.dart';
import '../../../../domain/entity/categories.dart';

class CategoriesScreenModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _categories = <Category>[];

  Future<void> _getCategories() async {
    final categories = await _apiClient.getCategories();
    _categories.addAll(categories);
    notifyListeners();
  }

  List<Category> get categories => _categories;

  CategoriesScreenModel() {
    _getCategories();
    
  }
}
