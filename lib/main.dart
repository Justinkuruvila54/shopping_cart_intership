// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_intership/presentation/bottom_navigation_screen.dart/view/bottom_navigation_screen.dart';
import 'package:shopping_cart_intership/repositary/api/get_product_list_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('products');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetProductListApicontroller(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Bottomnavigationscreen(),
      ),
    );
  }
}
