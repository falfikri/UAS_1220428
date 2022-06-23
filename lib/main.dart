import 'package:flutter/material.dart';
import 'package:uas_1220428/ui/order_handphone_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Order Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OrderHandphoneScreen(),
    );
  }
}