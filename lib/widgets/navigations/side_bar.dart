import 'package:flutter/material.dart';
import 'package:flutter_wanna_shop/domain/api_clients/api_client.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
              ElevatedButton(
                  onPressed: () async {
                    var box = await Hive.openBox('tokenBox');
                    var token = box.get('token');
                    print(token);
                    if (token != null) {
                      await ApiClient().logout(token: token);
                      box.delete('token');
                    }
                  },
                  child: Text('Logout'))
            ],
          )),
    );
  }
}
