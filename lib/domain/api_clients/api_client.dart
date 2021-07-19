import 'dart:convert';
import 'dart:io';

import 'package:flutter_wanna_shop/domain/entity/categories.dart';
import 'package:flutter_wanna_shop/domain/entity/products.dart';

class ApiClient {
  final client = HttpClient();

  Future<dynamic> getProducts() async {
    final url = Uri.parse('https://mdatest2.herokuapp.com/api/products/');
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;

    final products = json
        .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return products;
  }

  Future<dynamic> getCategories() async {
    final url = Uri.parse('https://mdatest2.herokuapp.com/api/categories/');
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;

    final categories = json
        .map((e) => Categories.fromJson(e as Map<String, dynamic>))
        .toList();

    return categories;
  }
}
