import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'dishes.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 1)
class Dish {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final int weight;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String? imageUrl;
  @HiveField(6)
  final List<String> tegs;
  Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    // image_url renamed to imageUrl
    required this.imageUrl,
    required this.tegs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'weight': weight,
      'description': description,
      'image_url': imageUrl,
      'tegs': tegs,
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
        id: map['id'] as int,
        name: map['name'] as String,
        price: map['price'] as int,
        weight: map['weight'] as int,
        description: map['description'] as String,
        imageUrl: map['image_url'] as String?,
        tegs: List<String>.from(
          (map['tegs'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Dish.fromJson(String source) =>
      Dish.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<Dish> getListDish(Map<String, dynamic> map) {
    final list = map.values.firstOrNull;
    final categories =
        list.map<Dish>((e) => Dish.fromMap(e as Map<String, dynamic>)).toList();
    return categories;
  }


  @override
  bool operator ==(covariant Dish other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.weight == weight &&
      other.description == description &&
      other.imageUrl == imageUrl &&
      listEquals(other.tegs, tegs);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      weight.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      tegs.hashCode;
  }
}
