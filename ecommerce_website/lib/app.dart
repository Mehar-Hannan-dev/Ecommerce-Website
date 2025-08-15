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
      appBar: AppBar(title: const Text('404 - Page Not Found')),
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

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) => const UnknownRoutePage(),
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductsListPage(),
        routes: [
          GoRoute(
            path: 'productid',
            builder: (context, state) => ProductDetailPage(
              productid: state.pathParameters['productid']!,
            ),
          ),
          GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
          GoRoute(
            path: '/checkout',
            builder: (context, state) => const CheckoutPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const UserProfilePage(),
          ),

          //Admin Panel Routes
          GoRoute(
            path: '/panel',
            builder: (context, state) => const DashboardPage(),
            routes: [
              GoRoute(
                path: 'orders',
                builder: (context, state) => const OrderManagementPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
