import 'package:flutter/material.dart';
import 'package:flutter_wanna_shop/domain/api_clients/api_client.dart';
import 'package:flutter_wanna_shop/domain/entity/cart_item.dart';
import 'package:flutter_wanna_shop/domain/entity/products.dart';
import 'package:flutter_wanna_shop/pages/Cart/cart.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductsCart extends StatefulWidget {
  const ProductsCart({Key? key}) : super(key: key);

  @override
  _ProductsCartState createState() => _ProductsCartState();
}

class _ProductsCartState extends State<ProductsCart> {
  late List<dynamic> _productitem;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProd();
  }

  Future<void> getProd() async {
    var box = await Hive.openBox('tokenBox');
    var token = box.get('token');
    print(token);
    if (token != null) {
      _productitem = await ApiClient().readCart(token: token);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Cart(productitem: _productitem);
  }
}
