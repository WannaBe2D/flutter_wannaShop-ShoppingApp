import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.account_box),
                    SizedBox(
                      width: 16,
                    ),
                    Text('Sneakers')
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.account_box),
                    SizedBox(
                      width: 16,
                    ),
                    Text('Sneakers')
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.account_box),
                    SizedBox(
                      width: 16,
                    ),
                    Text('Sneakers')
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
