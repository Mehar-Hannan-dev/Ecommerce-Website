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
            top: 12,
            left: 12,
            right: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResponsiveText(
                  text: 'CoCo',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.primaryText,
                  ),
                  mobileFontSize: 12,
                  desktopFontSize: 24,
                  tabletFontSize: 20,
                  mobileLandscapeFontSize: 18,
                  tabletLandscapeFontSize: 22,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8,
                    children: [
                      ResponsiveText(
                        text: 'Products',
                        textStyle: TextStyle(fontWeight: FontWeight.normal),
                        mobileFontSize: 8,
                        desktopFontSize: 18,
                        tabletFontSize: 16,
                        mobileLandscapeFontSize: 15,
                        tabletLandscapeFontSize: 17,
                      ),
                      ResponsiveText(
                        text: 'Our Story',
                        textStyle: TextStyle(fontWeight: FontWeight.normal),
                        mobileFontSize: 8,
                        desktopFontSize: 18,
                        tabletFontSize: 16,
                        mobileLandscapeFontSize: 15,
                        tabletLandscapeFontSize: 17,
                      ),
                      ResponsiveText(
                        text: 'News & Events',
                        textStyle: TextStyle(fontWeight: FontWeight.normal),
                        mobileFontSize: 8,
                        desktopFontSize: 18,
                        tabletFontSize: 16,
                        mobileLandscapeFontSize: 15,
                        tabletLandscapeFontSize: 17,
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 5,
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
                      padding: const ResponsiveValue(
                        mobile: EdgeInsetsGeometry.directional(
                          start: 8,
                          end: 8,
                          top: 4,
                          bottom: 4,
                        ),
                        desktop: EdgeInsetsGeometry.directional(
                          start: 16,
                          end: 16,
                          top: 8,
                          bottom: 8,
                        ),
                        tablet: EdgeInsetsGeometry.directional(
                          start: 12,
                          end: 12,
                          top: 6,
                          bottom: 6,
                        ),
                        mobileLandscape: EdgeInsetsGeometry.directional(
                          start: 8,
                          end: 8,
                          top: 4,
                          bottom: 4,
                        ),
                        tabletLandscape: EdgeInsetsGeometry.directional(
                          start: 12,
                          end: 12,
                          top: 6,
                          bottom: 6,
                        ),
                      ),
                      child: ResponsiveText(
                        text: 'Log In',
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.primaryText,
                        ),
                        mobileFontSize: 12,
                        desktopFontSize: 16,
                        tabletFontSize: 14,
                        mobileLandscapeFontSize: 12,
                        tabletLandscapeFontSize: 14,
                      ),
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
