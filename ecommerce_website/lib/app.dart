import 'package:flutter/material.dart';

//import Navigation2.0
import 'package:go_router/go_router.dart';

//import theme.dart
import 'package:ecommerce_website/Theme/theme.dart';

//import cwp.dart
import 'package:ecommerce_website/Widget Properties/cwp.dart';

//import website pages
import 'package:ecommerce_website/website/pages/home_page.dart';
import 'package:ecommerce_website/website/pages/cart_page.dart';
import 'package:ecommerce_website/website/pages/checkout_page.dart';
import 'package:ecommerce_website/website/pages/product_detail_page.dart';
import 'package:ecommerce_website/website/pages/products_list_page.dart';
import 'package:ecommerce_website/website/pages/user_profile_page.dart';

//import panel pages
import 'package:ecommerce_website/panel/pages/dashboard_page.dart';
import 'package:ecommerce_website/panel/pages/order_management_page.dart';
import 'package:ecommerce_website/panel/pages/product_editor_page.dart';
import 'package:ecommerce_website/panel/pages/settings_page.dart';
import 'package:ecommerce_website/panel/pages/user_management_page.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 - Page Not Found'),
      ),
      body: Center(
        child: Text(
          'The page you are looking for does not exist.',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}