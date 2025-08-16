import 'package:flutter/material.dart';

import 'package:ecommerce_website/Theme/theme.dart';
import 'package:ecommerce_website/Widget Properties/cwp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const ResponsiveText(text: 'Home Page')),
      body: Center(
        child: Text('Welcome to the Home Page', style: context.bodyLarge),
      ),
    );
  }
}
