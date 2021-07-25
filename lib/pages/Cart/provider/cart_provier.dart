import 'package:flutter/material.dart';
import 'package:flutter_wanna_shop/domain/api_clients/api_client.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> _products = [];
  bool _isLoading = true;

  List<dynamic> get products => _products;
  bool get isLoading => _isLoading;

  void initProducts() async {
    var box = await Hive.openBox('tokenBox');
    var token = box.get('token');
    if (token != null) {
      _products = await ApiClient().readCart(token: token);
      _isLoading = false;
    }
    notifyListeners();
  }

  void deleteProduct(int id, dynamic item) async {
    var box = await Hive.openBox('tokenBox');
    var token = box.get('token');
    if (token != null) {
      await ApiClient().deleteItemCart(token: token, id: id);
      _products.remove(item);
    }
    notifyListeners();
  }

  void dispose() {}
}
