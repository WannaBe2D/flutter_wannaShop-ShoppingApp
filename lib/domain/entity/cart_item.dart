import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CartItem {
  final int id;
  final String name;
  final List<String> image;

  CartItem(this.id, this.name, this.image);

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    json['id'] as int,
    json['name'] as String,
    (json['image'] as List<dynamic>).map((e) => e as String).toList(),
  );
}
