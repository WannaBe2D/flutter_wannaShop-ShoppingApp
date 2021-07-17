import 'package:flutter/material.dart';
import 'package:flutter_wanna_shop/domain/api_clients/api_client.dart';
import 'package:flutter_wanna_shop/widgets/buttons/buttons.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: TextButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image(
              image: AssetImage(
            'assets/icons/menu.png',
          )),
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              minimumSize: Size(40, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              side: BorderSide(color: Colors.black, width: 1),
              onPrimary: Colors.grey),
        )),
        Container(
          child: Row(
            children: [
              Container(
                  child: TextButton(
                onPressed: () {
                  ApiClient().getProducts();
                },
                child: Image(
                    image: AssetImage(
                  'assets/icons/loupe.png',
                )),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    side: BorderSide(color: Colors.grey, width: 1),
                    onPrimary: Colors.grey),
              )),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Image(
                      image: AssetImage(
                    'assets/icons/controls.png',
                  )),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(40, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      side: BorderSide(color: Colors.grey, width: 1),
                      onPrimary: Colors.grey),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
