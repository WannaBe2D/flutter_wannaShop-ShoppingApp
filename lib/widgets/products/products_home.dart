import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanna_shop/domain/api_clients/api_client.dart';
import 'package:flutter_wanna_shop/domain/entity/products.dart';
import 'package:flutter_wanna_shop/widgets/products/product_home_page.dart';

class ProductsHome extends StatefulWidget {
  const ProductsHome({Key? key}) : super(key: key);

  @override
  _ProductsHomeState createState() => _ProductsHomeState();
}

class _ProductsHomeState extends State<ProductsHome> {
  late List<ProductItem> _productitem;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProd();
  }

  Future<void> getProd() async {
    _productitem = await ApiClient().getProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ProductsGrid(productitem: _productitem);
  }
}
