import 'package:flutter/material.dart';
import 'package:flutter_wanna_shop/widgets/category/home_category.dart';
import 'package:flutter_wanna_shop/widgets/navigations/top_bar.dart';
import 'package:flutter_wanna_shop/widgets/products/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        //TopBar(),
        SizedBox(
          height: 16,
        ),
        AllCategories(),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 16, top: 24),
          child: Text(
            'Recommanded for you',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: AllProducts(),
        ),
      ],
    ));
  }
}
