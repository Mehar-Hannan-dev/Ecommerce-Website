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
      body: Stack(
        children: [
          Column(children: []),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(text: 'text'),
              Row(
                children: [
                  ResponsiveText(text: 'text'),
                  ResponsiveText(text: 'text'),
                  ResponsiveText(text: 'text'),
                ],
              ),
              Row(
                children: [
                  ResponsiveIcon(
                    icon: Icons.search_rounded,
                    size: const ResponsiveValue(
                      mobile: 16,
                      desktop: 24,
                      tablet: 20,
                    ),
                  ),
                  ResponsiveIcon(
                    icon: Icons.shopping_bag_rounded,
                    size: const ResponsiveValue(
                      mobile: 16,
                      desktop: 24,
                      tablet: 20,
                    ),
                  ),
                  ResponsiveButton(
                    child: ResponsiveText(text: 'text'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
