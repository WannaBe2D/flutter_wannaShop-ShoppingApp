import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_wanna_shop/domain/api_clients/api_client.dart';
import 'package:flutter_wanna_shop/domain/entity/cart_item.dart';
import 'package:flutter_wanna_shop/domain/entity/products.dart';
import 'package:flutter_wanna_shop/pages/Cart/provider/cart_provier.dart';
import 'package:flutter_wanna_shop/widgets/products/products_cart.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: _CartItem(),
    );
  }
}

class _CartItem extends StatefulWidget {
  const _CartItem({Key? key}) : super(key: key);

  @override
  __CartItemState createState() => __CartItemState();
}

class __CartItemState extends State<_CartItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartProvider>().initProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<CartProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: context.watch<CartProvider>().products.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(context
                            .watch<CartProvider>()
                            .products[index]
                            .price);
                        var _currentImage = [];
                        context
                            .watch<CartProvider>()
                            .products[index]
                            .image
                            .map((e) {
                          if (e.indexOf('01') != -1) _currentImage.add(e);
                        }).toList();
                        return _Product(
                          name: context
                              .watch<CartProvider>()
                              .products[index]
                              .name,
                          image: _currentImage[0],
                          id: context.watch<CartProvider>().products[index].id,
                        );
                      }),
                ))
              ],
            ),
    );
  }
}

class _Product extends StatelessWidget {
  final String name;
  final String image;
  final int id;
  const _Product(
      {Key? key, required this.name, required this.image, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 120,
                    height: 126,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        Text(
                          'Price: \$150',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        Text('Size: Large',
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                        Text('Color: Black',
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                        SizedBox(
                          height: 24,
                        ),
                        /*Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                            Text('1'),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            )
                          ],
                        )*/
                        SizedBox(
                          height: 22,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  context.read<CartProvider>().deleteProduct(id, id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(top: 4),
                  child: Icon(Icons.delete_outline_outlined),
                ),
              )
            ],
          ),
        ));
  }
}

/*class Cart extends StatelessWidget {
  final List<dynamic> productitem;
  const Cart({Key? key, required this.productitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: productitem.length,
                    itemBuilder: (BuildContext context, int index) {
                      var _currentImage = [];
                      productitem[index].image.map((e) {
                        if (e.indexOf('01') != -1) _currentImage.add(e);
                      }).toList();
                      return _CartItem(
                        name: productitem[index].name,
                        image: _currentImage[0],
                        id: productitem[index].id,
                      );
                    }),
              ),
            ),
            _Info()
          ],
        ));
  }
}*/

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      height: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text('\$440',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('VAT', style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text('\$20',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery fee',
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text('\$50',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sub Total',
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text('\$510',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(255, 185, 5, 1)),
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Proceed to checkout',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

/*class _CartItem extends StatefulWidget {
  final String name;
  final String image;
  final int id;
  const _CartItem(
      {Key? key, required this.name, required this.image, required this.id})
      : super(key: key);

  @override
  __CartItemState createState() => __CartItemState();
}

class __CartItemState extends State<_CartItem> {
  void _delete(int id) async {
    var box = await Hive.openBox('tokenBox');
    var token = box.get('token');
    if (token != null) {
      await ApiClient().deleteItemCart(token: token, id: id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 120,
                    height: 126,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name),
                        Text(
                          'Price: \$150',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        Text('Size: Large',
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                        Text('Color: Black',
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                            Text('1'),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  print('mda');
                  _delete(widget.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(top: 4),
                  child: Icon(Icons.delete_outline_outlined),
                ),
              )
            ],
          ),
        ));
  }
}*/
