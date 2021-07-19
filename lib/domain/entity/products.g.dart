// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) {
  return ProductItem(
    json['id'] as int,
    json['name'] as String,
    json['sex'] as String,
    json['description'] as String,
    json['price'] as String,
    json['category'] as int,
    (json['image'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sex': instance.sex,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'image': instance.image,
    };
