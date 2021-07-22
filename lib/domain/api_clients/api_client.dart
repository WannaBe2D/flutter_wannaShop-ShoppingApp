import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_wanna_shop/domain/entity/categories.dart';
import 'package:flutter_wanna_shop/domain/entity/products.dart';

class ApiClient {
  final client = http.Client();

  /*Future<dynamic> getProducts() async {
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
  }*/

  Future<dynamic> getProducts() async {
    final url = Uri.parse('https://mdatest2.herokuapp.com/api/products/');
    final response = await client.get(url);
    print('Response body: ${response.body}');
    final mda = response.body;

    final json = jsonDecode(mda) as List<dynamic>;

    final products = json
        .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return products;
  }

  Future<dynamic> getCategories() async {
    final url = Uri.parse('https://mdatest2.herokuapp.com/api/categories/');
    final response = await client.get(url);

    final mda = response.body;
    final json = jsonDecode(mda) as List<dynamic>;

    final categories = json
        .map((e) => Categories.fromJson(e as Map<String, dynamic>))
        .toList();

    return categories;
  }

  Future<String> getToken(
      {required String username, required String password}) async {
    var url = Uri.parse('https://mdatest2.herokuapp.com/auth/token');
    var response = await client
        .post(url, body: {'username': username, 'password': password});

    final token = jsonDecode(response.body) as Map<String, dynamic>;
    return token['token'];
  }

  Future<int> createUser(
      {required String email, required String username, required String password}) async {
    final msg = jsonEncode({'email': email, 'username': username, 'password': password});
    var url = Uri.parse('https://mdatest2.herokuapp.com/auth/users/');
    var response = await client
        .post(url,
        headers: {"Content-Type": "application/json"},
        body: msg);

    //final token = jsonDecode(response.body) as Map<String, dynamic>;
    return response.statusCode;
  }
}
