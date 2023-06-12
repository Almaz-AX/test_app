// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:test_app/domain/entity/dishes.dart';

part 'cart_items.g.dart';

@HiveType(typeId: 0)
class CartItems{
  @HiveField(0)
  final Dish item;
  @HiveField(1)
  int count;
  CartItems({
    required this.item,
    required this.count,
  });
}
