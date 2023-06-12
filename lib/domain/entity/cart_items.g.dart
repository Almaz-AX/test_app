// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemsAdapter extends TypeAdapter<CartItems> {
  @override
  final int typeId = 0;

  @override
  CartItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItems(
      item: fields[0] as Dish,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartItems obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.item)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
