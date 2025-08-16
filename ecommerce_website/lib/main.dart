import 'package:flutter/material.dart';
import 'package:ecommerce_website/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoot();
  }
}
