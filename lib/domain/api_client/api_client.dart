import 'dart:convert';
import 'dart:io';

import '../entity/categories.dart';
import '../entity/dishes.dart';

class ApiClient {
  static const _uriCategories =
      'https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54';
  static const _uriDishes =
      'https://run.mocky.io/v3/c7a508f2-a904-498a-8539-09d96785446e';
  final _client = HttpClient();

  Future<List<Category>> getCategories() async {
    final json = await _getResponseToMap(uri: _uriCategories);
    final categories = Category.getListCategory(json);
    return categories;
  }

  Future<List<Dish>> getDishes() async {
    final json = await _getResponseToMap(uri: _uriDishes);
    final dishes = Dish.getListDish(json);
    return dishes;
  }

  Future<Map<String, dynamic>> _getResponseToMap({required String uri}) async {
    final url = Uri.parse(uri);
    final request = await _client.getUrl(url);
    final response = await request.close();
    final source = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join());
    final json = jsonDecode(source) as Map<String, dynamic>;
    return json;
  }
}
