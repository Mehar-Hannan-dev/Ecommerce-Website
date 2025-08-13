import 'package:flutter/material.dart';

// 1. DeviceType Enum
enum DeviceType { mobile, mobileLandscape, tablet, tabletLandscape, desktop }

// 2. Breakpoints for responsiveness
const double _mobileBreakpoint = 600.0;
const double _tabletBreakpoint = 1000.0;

// 3. Utility function to get base DeviceCategory (without orientation)
DeviceType getDeviceType(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  if (width < _mobileBreakpoint) {
    return DeviceType.mobile;
  } else if (width < _tabletBreakpoint) {
    return DeviceType.tablet;
  } else {
    return DeviceType.desktop;
  }
}

// 4. ResponsiveVisibility Widget
class ResponsiveVisibility extends StatelessWidget {
  final Widget child;
  final bool showForMobile;
  final bool showForMobileLandscape;
  final bool showForTablet;
  final bool showForTabletLandscape;
  final bool showForDesktop;

  const ResponsiveVisibility({
    super.key,
    required this.child,
    this.showForMobile = true,
    this.showForMobileLandscape = false,
    this.showForTablet = true,
    this.showForTabletLandscape = false,
    this.showForDesktop = true,
  });

  @override
  Widget build(BuildContext context) {
    final DeviceType baseDeviceCategory = getDeviceType(context);
    final Orientation orientation = MediaQuery.of(context).orientation;

    bool shouldShow = false;

    switch (baseDeviceCategory) {
      case DeviceType.mobile:
        if (orientation == Orientation.landscape) {
          shouldShow = showForMobileLandscape;
        } else {
          shouldShow = showForMobile;
        }
        break;
      case DeviceType.tablet:
        if (orientation == Orientation.landscape) {
          shouldShow = showForTabletLandscape;
        } else {
          shouldShow = showForTablet;
        }
        break;
      case DeviceType.desktop:
        shouldShow = showForDesktop;
        break;
      case DeviceType.mobileLandscape:
      case DeviceType.tabletLandscape:
        break;
    }

    return shouldShow ? child : const SizedBox.shrink();
  }
}

// 5. ResponsiveSizedBox Widget
class ResponsiveSizedBox extends StatelessWidget {
  final Widget child;
  final double? widthPercentage;
  final double? heightPercentage;
  final double? fixedWidth;
  final double? fixedHeight;

  const ResponsiveSizedBox({
    super.key,
    required this.child,
    this.widthPercentage,
    this.heightPercentage,
    this.fixedWidth,
    this.fixedHeight,
  }) : assert(
         (widthPercentage == null ||
                 (widthPercentage >= 0.0 && widthPercentage <= 1.0)) &&
             (heightPercentage == null ||
                 (heightPercentage >= 0.0 && heightPercentage <= 1.0)),
         'Percentages must be between 0.0 and 1.0',
       );

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    double? calculatedWidth;
    if (fixedWidth != null) {
      calculatedWidth = fixedWidth;
    } else if (widthPercentage != null) {
      calculatedWidth = screenSize.width * widthPercentage!;
    }

    double? calculatedHeight;
    if (fixedHeight != null) {
      calculatedHeight = fixedHeight;
    } else if (heightPercentage != null) {
      calculatedHeight = screenSize.height * heightPercentage!;
    }

    return SizedBox(
      width: calculatedWidth,
      height: calculatedHeight,
      child: child,
    );
  }
}

// 6. CustomPadding Widget
class CustomPadding extends StatelessWidget {
  final Widget child;
  final double? all;
  final double? horizontal;
  final double? vertical;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const CustomPadding({
    super.key,
    required this.child,
    this.all,
    this.horizontal,
    this.vertical,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding;

    if (all != null) {
      padding = EdgeInsets.all(all!);
    } else if (horizontal != null || vertical != null) {
      padding = EdgeInsets.symmetric(
        horizontal: horizontal ?? 0.0,
        vertical: vertical ?? 0.0,
      );
    } else {
      padding = EdgeInsets.only(
        top: top ?? 0.0,
        bottom: bottom ?? 0.0,
        left: left ?? 0.0,
        right: right ?? 0.0,
      );
    }

    return Padding(padding: padding, child: child);
  }
}

// 7. ResponsiveText Widget
class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  final double? mobileFontSize;
  final double? mobileLandscapeFontSize;
  final double? tabletFontSize;
  final double? tabletLandscapeFontSize;
  final double? desktopFontSize;

  const ResponsiveText({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.mobileFontSize,
    this.mobileLandscapeFontSize,
    this.tabletFontSize,
    this.tabletLandscapeFontSize,
    this.desktopFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final DeviceType baseDeviceCategory = getDeviceType(context);
    final Orientation orientation = MediaQuery.of(context).orientation;

    double? currentFontSize;

    switch (baseDeviceCategory) {
      case DeviceType.mobile:
        if (orientation == Orientation.landscape &&
            mobileLandscapeFontSize != null) {
          currentFontSize = mobileLandscapeFontSize;
        } else {
          currentFontSize = mobileFontSize;
        }
        break;
      case DeviceType.tablet:
        if (orientation == Orientation.landscape &&
            tabletLandscapeFontSize != null) {
          currentFontSize = tabletLandscapeFontSize;
        } else {
          currentFontSize = tabletFontSize;
        }
        break;
      case DeviceType.desktop:
        currentFontSize = desktopFontSize;
        break;
      case DeviceType.mobileLandscape:
      case DeviceType.tabletLandscape:
        break;
    }

    final TextStyle effectiveTextStyle = (textStyle ?? const TextStyle())
        .copyWith(fontSize: currentFontSize);

    return Text(text, style: effectiveTextStyle, textAlign: textAlign);
  }
}

// 8. ResponsiveConstraintBox Widget
class ResponsiveConstraintBox extends StatelessWidget {
  final Widget child;

  final double? minWidthMobile;
  final double? maxWidthMobile;
  final double? minHeightMobile;
  final double? maxHeightMobile;

  final double? minWidthMobileLandscape;
  final double? maxWidthMobileLandscape;
  final double? minHeightMobileLandscape;
  final double? maxHeightMobileLandscape;

  final double? minWidthTablet;
  final double? maxWidthTablet;
  final double? minHeightTablet;
  final double? maxHeightTablet;

  final double? minWidthTabletLandscape;
  final double? maxWidthTabletLandscape;
  final double? minHeightTabletLandscape;
  final double? maxHeightTabletLandscape;

  final double? minWidthDesktop;
  final double? maxWidthDesktop;
  final double? minHeightDesktop;
  final double? maxHeightDesktop;

  const ResponsiveConstraintBox({
    super.key,
    required this.child,
    this.minWidthMobile,
    this.maxWidthMobile,
    this.minHeightMobile,
    this.maxHeightMobile,
    this.minWidthMobileLandscape,
    this.maxWidthMobileLandscape,
    this.minHeightMobileLandscape,
    this.maxHeightMobileLandscape,
    this.minWidthTablet,
    this.maxWidthTablet,
    this.minHeightTablet,
    this.maxHeightTablet,
    this.minWidthTabletLandscape,
    this.maxWidthTabletLandscape,
    this.minHeightTabletLandscape,
    this.maxHeightTabletLandscape,
    this.minWidthDesktop,
    this.maxWidthDesktop,
    this.minHeightDesktop,
    this.maxHeightDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final DeviceType baseDeviceCategory = getDeviceType(context);
    final Orientation orientation = MediaQuery.of(context).orientation;

    double? currentMinWidth;
    double? currentMaxWidth;
    double? currentMinHeight;
    double? currentMaxHeight;

    switch (baseDeviceCategory) {
      case DeviceType.mobile:
        if (orientation == Orientation.landscape) {
          currentMinWidth = minWidthMobileLandscape;
          currentMaxWidth = maxWidthMobileLandscape;
          currentMinHeight = minHeightMobileLandscape;
          currentMaxHeight = maxHeightMobileLandscape;
        } else {
          currentMinWidth = minWidthMobile;
          currentMaxWidth = maxWidthMobile;
          currentMinHeight = minHeightMobile;
          currentMaxHeight = maxHeightMobile;
        }
        break;
      case DeviceType.tablet:
        if (orientation == Orientation.landscape) {
          currentMinWidth = minWidthTabletLandscape;
          currentMaxWidth = maxWidthTabletLandscape;
          currentMinHeight = minHeightTabletLandscape;
          currentMaxHeight = maxHeightTabletLandscape;
        } else {
          currentMinWidth = minWidthTablet;
          currentMaxWidth = maxWidthTablet;
          currentMinHeight = minHeightTablet;
          currentMaxHeight = maxHeightTablet;
        }
        break;
      case DeviceType.desktop:
        currentMinWidth = minWidthDesktop;
        currentMaxWidth = maxWidthDesktop;
        currentMinHeight = minHeightDesktop;
        currentMaxHeight = maxHeightDesktop;
        break;
      case DeviceType.mobileLandscape:
      case DeviceType.tabletLandscape:
        break;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: currentMinWidth ?? 0.0,
        maxWidth: currentMaxWidth ?? double.infinity,
        minHeight: currentMinHeight ?? 0.0,
        maxHeight: currentMaxHeight ?? double.infinity,
      ),
      child: child,
    );
  }
}

// 9. ResponsiveSpacer Widget
class ResponsiveSpacer extends StatelessWidget {
  final double? widthMobile;
  final double? heightMobile;
  final double? widthMobileLandscape;
  final double? heightMobileLandscape;
  final double? widthTablet;
  final double? heightTablet;
  final double? widthTabletLandscape;
  final double? heightTabletLandscape;
  final double? widthDesktop;
  final double? heightDesktop;

  const ResponsiveSpacer({
    super.key,
    this.widthMobile,
    this.heightMobile,
    this.widthMobileLandscape,
    this.heightMobileLandscape,
    this.widthTablet,
    this.heightTablet,
    this.widthTabletLandscape,
    this.heightTabletLandscape,
    this.widthDesktop,
    this.heightDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final DeviceType baseDeviceCategory = getDeviceType(context);
    final Orientation orientation = MediaQuery.of(context).orientation;

    double? currentWidth;
    double? currentHeight;

    switch (baseDeviceCategory) {
      case DeviceType.mobile:
        if (orientation == Orientation.landscape) {
          currentWidth = widthMobileLandscape;
          currentHeight = heightMobileLandscape;
        } else {
          currentWidth = widthMobile;
          currentHeight = heightMobile;
        }
        break;
      case DeviceType.tablet:
        if (orientation == Orientation.landscape) {
          currentWidth = widthTabletLandscape;
          currentHeight = heightTabletLandscape;
        } else {
          currentWidth = widthTablet;
          currentHeight = heightTablet;
        }
        break;
      case DeviceType.desktop:
        currentWidth = widthDesktop;
        currentHeight = heightDesktop;
        break;
      case DeviceType.mobileLandscape:
      case DeviceType.tabletLandscape:
        break;
    }

    return SizedBox(width: currentWidth, height: currentHeight);
  }
}

// 10. ResponsiveBuilder Widget (NEW)
typedef ResponsiveWidgetBuilder =
    Widget Function(
      BuildContext context,
      DeviceType deviceType,
      Orientation orientation,
    );

class ResponsiveBuilder extends StatelessWidget {
  final ResponsiveWidgetBuilder builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = getDeviceType(
      context,
    ); // Use the utility function directly
    final Orientation orientation = MediaQuery.of(context).orientation;
    return builder(context, deviceType, orientation);
  }
}

// 11. ResponsiveValue Utility (NEW)
class ResponsiveValue<T> {
  final T? mobile;
  final T? mobileLandscape;
  final T? tablet;
  final T? tabletLandscape;
  final T? desktop;

  const ResponsiveValue({
    this.mobile,
    this.mobileLandscape,
    this.tablet,
    this.tabletLandscape,
    this.desktop,
  });

  T? get(BuildContext context) {
    final DeviceType baseDeviceCategory = getDeviceType(context);
    final Orientation orientation = MediaQuery.of(context).orientation;

    switch (baseDeviceCategory) {
      case DeviceType.mobile:
        if (orientation == Orientation.landscape && mobileLandscape != null) {
          return mobileLandscape;
        }
        return mobile;
      case DeviceType.tablet:
        if (orientation == Orientation.landscape && tabletLandscape != null) {
          return tabletLandscape;
        }
        return tablet;
      case DeviceType.desktop:
        return desktop;
      case DeviceType.mobileLandscape:
      case DeviceType.tabletLandscape:
        return null; // Should not be reached in this logic flow
    }
  }
}

// 12. ResponsiveLayoutGrid Widget (NEW)
class ResponsiveLayoutGrid extends StatelessWidget {
  final List<Widget> children;
  final int mobileColumns;
  final int mobileLandscapeColumns;
  final int tabletColumns;
  final int tabletLandscapeColumns;
  final int desktopColumns;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double? childAspectRatio;

  const ResponsiveLayoutGrid({
    super.key,
    required this.children,
    this.mobileColumns = 1,
    this.mobileLandscapeColumns = 2,
    this.tabletColumns = 2,
    this.tabletLandscapeColumns = 3,
    this.desktopColumns = 4,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final DeviceType baseDeviceCategory = getDeviceType(context);
    final Orientation orientation = MediaQuery.of(context).orientation;

    int currentColumns;

    switch (baseDeviceCategory) {
      case DeviceType.mobile:
        if (orientation == Orientation.landscape) {
          currentColumns = mobileLandscapeColumns;
        } else {
          currentColumns = mobileColumns;
        }
        break;
      case DeviceType.tablet:
        if (orientation == Orientation.landscape) {
          currentColumns = tabletLandscapeColumns;
        } else {
          currentColumns = tabletColumns;
        }
        break;
      case DeviceType.desktop:
        currentColumns = desktopColumns;
        break;
      case DeviceType.mobileLandscape:
      case DeviceType.tabletLandscape:
        currentColumns = 1; // Fallback, should be covered by logic above
        break;
    }

    return GridView.builder(
      shrinkWrap: true, // Important if used inside a Column/ListView
      physics:
          const NeverScrollableScrollPhysics(), // To prevent double scrolling if parent is scrollable
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: currentColumns,
        mainAxisSpacing: mainAxisSpacing ?? 0.0,
        crossAxisSpacing: crossAxisSpacing ?? 0.0,
        childAspectRatio: childAspectRatio ?? 1.0,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );
  }
}
