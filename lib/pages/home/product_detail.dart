import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final List<String> images;
  final String name;
  final String price;
  final String description;
  const ProductDetail(
      {Key? key,
      required this.images,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _Carousel(
        images: images,
        name: name,
        price: price,
        description: description,
      ),
      floatingActionButton: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.grey[200],
        onTap: () {},
        child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(255, 185, 5, 1)),
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Add to Cart',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _Carousel extends StatelessWidget {
  final List<String> images;
  final String name;
  final String price;
  final String description;
  const _Carousel(
      {Key? key,
      required this.images,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            LimitedBox(
                maxHeight: 264,
                child: PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _ProductImage(img: images[index]);
                    })),
            _ProductDescription(
              name: name,
              price: price,
              description: description,
            ),
          ],
        ));
  }
}

class _ProductImage extends StatelessWidget {
  final String img;
  const _ProductImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 264,
      child: Image.network(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  const _ProductDescription(
      {Key? key,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '\$${price}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Choose Size',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              _Size(size: "S"),
              _Size(size: "M"),
              _Size(size: "M"),
              _Size(size: "XL"),
            ],
          ),
          SizedBox(
            height: 21,
          ),
          Text('Detail',
              style: TextStyle(fontSize: 18, color: Colors.grey[600])),
          SizedBox(
            height: 7,
          ),
          Text(description,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]))
        ],
      ),
    );
  }
}

class _Size extends StatelessWidget {
  final String size;
  const _Size({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      width: 40,
      height: 40,
      child: Text(
        size,
        style: TextStyle(fontSize: 24, color: Colors.grey),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
