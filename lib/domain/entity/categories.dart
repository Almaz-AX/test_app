// ignore_for_file: public_member_api_docs, sort_constructors_first

class Category {
  final int id;
  final String name;
  final String imageUrl;

  Category(
    this.id,
    this.name,
    // image_url renamed to imageUrl
    this.imageUrl,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image_url': imageUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['id'] as int,
      map['name'] as String,
      map['image_url'] as String,
    );
  }

  static List<Category> getListCategory(Map<String, dynamic> map) {
  // в ответ приходит вложенный список
  final list = map.values.firstOrNull;
  final categories = list.map<Category>((e) => Category.fromMap(e as Map<String,dynamic>)).toList();
  return categories;
}
}
