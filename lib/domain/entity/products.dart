import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class ProductItem {
  final int id;
  final String name;
  final String sex;
  final String description;
  final String price;
  final int category;
  final List<String> image;

  ProductItem(this.id, this.name, this.sex, this.description, this.price,
      this.category, this.image);

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}
