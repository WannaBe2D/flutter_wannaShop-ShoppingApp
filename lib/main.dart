import 'package:flutter/material.dart';
import 'package:flutter_wanna_shop/widgets/navigations/nav.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  return runApp(MaterialApp(
    home: Nav(),
  ));
}
