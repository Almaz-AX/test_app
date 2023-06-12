import 'package:hive_flutter/adapters.dart';

import '../entity/cart_items.dart';
import '../entity/dishes.dart';

class LocalStorageService {
  static const boxName = 'DishesInCart';
  Future<Box<CartItems>> getBox() async {
    _registerAdapter();
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }
    return await Hive.openBox<CartItems>(boxName);
  }

  void _registerAdapter() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CartItemsAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(DishAdapter());
    }
  }

  Future<void> saveItem(Dish dish) async {
    final box = await getBox();
    final itemBox = box.get(dish.id);
    if (itemBox != null) {
      box.put(dish.id, CartItems(item: itemBox.item, count: itemBox.count + 1));
    } else {
      box.put(dish.id, CartItems(item: dish, count: 1));
    }
  }

  Future<void> deleteItem(Dish dish) async {
    final box = await getBox();
    final itemBox = box.get(dish.id);
    if (itemBox == null) {
      return;
    }
    if (itemBox.count > 1) {
      box.put(dish.id, CartItems(item: dish, count: itemBox.count - 1));
    } else {
      box.delete(dish.id);
    }
  }

  Future<List<CartItems>> getItems() async {
    _registerAdapter();
    final box = await Hive.openBox<CartItems>(boxName);
    return box.values.toList();
  }
}
