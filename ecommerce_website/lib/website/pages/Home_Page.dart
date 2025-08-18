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
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ResponsiveContainer(
                      height: const ResponsiveValue(
                        mobile: 280,
                        desktop: 800,
                        tablet: 600,
                        mobileLandscape: 300,
                        tabletLandscape: 500,
                      ),
                      widthPercentage: ResponsiveValue(
                        mobile: 0.5,
                        desktop: 0.5,
                        tablet: 0.5,
                        mobileLandscape: 0.5,
                        tabletLandscape: 0.5,
                      ),
                      color: ResponsiveValue(
                        mobile: Colors.black,
                        desktop: Colors.black,
                        tablet: Colors.black,
                        mobileLandscape: Colors.black,
                        tabletLandscape: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomPadding(
                            top: 16,
                            left: 16,
                            right: 16,
                            child: ResponsiveText(
                              text: 'Welcome to CoCo',
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: context.primaryText,
                              ),
                              mobileFontSize: 24,
                              desktopFontSize: 48,
                              tabletFontSize: 36,
                              mobileLandscapeFontSize: 32,
                              tabletLandscapeFontSize: 40,
                            ),
                          ),
                          CustomPadding(
                            top: 8,
                            left: 16,
                            right: 16,
                            child: ResponsiveText(
                              text:
                                  'Discover our exclusive collection of products designed just for you.',
                              textStyle: TextStyle(color: context.primaryText),
                              mobileFontSize: 12,
                              desktopFontSize: 20,
                              tabletFontSize: 16,
                              mobileLandscapeFontSize: 14,
                              tabletLandscapeFontSize: 18,
                            ),
                          ),
                          CustomPadding(
                            top: 16,
                            left: 16,
                            right: 16,
                            child: Row(
                              spacing: 8,
                              children: [
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
                                    mobileLandscape:
                                        EdgeInsetsGeometry.directional(
                                          start: 8,
                                          end: 8,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                    tabletLandscape:
                                        EdgeInsetsGeometry.directional(
                                          start: 12,
                                          end: 12,
                                          top: 6,
                                          bottom: 6,
                                        ),
                                  ),
                                  child: ResponsiveText(
                                    text: 'View Our Collection',
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: context.primaryText,
                                    ),
                                    mobileFontSize: 6,
                                    desktopFontSize: 20,
                                    tabletFontSize: 16,
                                    mobileLandscapeFontSize: 12,
                                    tabletLandscapeFontSize: 18,
                                  ),
                                  onPressed: () {},
                                ),
                                ResponsiveIconButton(
                                  onPressed: () {},
                                  icon: Icons.arrow_outward_rounded,
                                  color: context.primaryText,
                                  iconSize: ResponsiveValue(
                                    mobile: 15,
                                    desktop: 24,
                                    tablet: 20,
                                    mobileLandscape: 18,
                                    tabletLandscape: 22,
                                  ),
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
                                    mobileLandscape:
                                        EdgeInsetsGeometry.directional(
                                          start: 8,
                                          end: 8,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                    tabletLandscape:
                                        EdgeInsetsGeometry.directional(
                                          start: 12,
                                          end: 12,
                                          top: 6,
                                          bottom: 6,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ResponsiveContainer(child: Stack(children: [])),
                        ],
                      ),
                    ),
                    ResponsiveContainer(
                      height: const ResponsiveValue(
                        mobile: 280,
                        desktop: 800,
                        tablet: 600,
                        mobileLandscape: 300,
                        tabletLandscape: 500,
                      ),
                      widthPercentage: ResponsiveValue(
                        mobile: 0.5,
                        desktop: 0.5,
                        tablet: 0.5,
                        mobileLandscape: 0.5,
                        tabletLandscape: 0.5,
                      ),
                      decoration: ResponsiveValue(
                        mobile: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/headerimage.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        desktop: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/headerimage.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        tablet: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/headerimage.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        mobileLandscape: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/headerimage.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        tabletLandscape: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/headerimage.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ResponsiveContainer(
                  height: const ResponsiveValue(
                    mobile: 200,
                    desktop: 400,
                    tablet: 300,
                    mobileLandscape: 200,
                    tabletLandscape: 300,
                  ),
                  widthPercentage: ResponsiveValue(
                    mobile: 1.0,
                    desktop: 1.0,
                    tablet: 1.0,
                    mobileLandscape: 1.0,
                    tabletLandscape: 1.0,
                  ),
                  color: ResponsiveValue(
                    mobile: Colors.white,
                    desktop: Colors.white,
                    tablet: Colors.white,
                    mobileLandscape: Colors.white,
                    tabletLandscape: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          CustomPadding(
            top: 12,
            left: 8,
            right: 8,
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
                    ResponsiveVisibility(
                      showForMobile: true,
                      showForDesktop: false,
                      showForTablet: false,
                      showForMobileLandscape: true,
                      showForTabletLandscape: false,
                      child: ResponsiveIcon(
                        icon: Icons.person_rounded,
                        size: const ResponsiveValue(
                          mobile: 16,
                          desktop: 24,
                          tablet: 20,
                        ),
                      ),
                    ),
                    ResponsiveVisibility(
                      showForMobile: false,
                      showForDesktop: true,
                      showForTablet: true,
                      showForMobileLandscape: true,
                      showForTabletLandscape: true,
                      child: ResponsiveButton(
                        padding: const ResponsiveValue(
                          mobile: EdgeInsetsGeometry.directional(
                            start: 0,
                            end: 0,
                            top: 0,
                            bottom: 0,
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
                          mobileFontSize: 8,
                          desktopFontSize: 16,
                          tabletFontSize: 14,
                          mobileLandscapeFontSize: 12,
                          tabletLandscapeFontSize: 14,
                        ),
                        onPressed: () {},
                      ),
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
