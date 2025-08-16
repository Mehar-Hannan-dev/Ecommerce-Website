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
          CustomPadding(
            top: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResponsiveText(
                  text: 'CoCo',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.primaryText,
                  ),
                  mobileFontSize: 16,
                  desktopFontSize: 24,
                  tabletFontSize: 20,
                  mobileLandscapeFontSize: 18,
                  tabletLandscapeFontSize: 22,
                ),
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
          ),
        ],
      ),
    );
  }
}
