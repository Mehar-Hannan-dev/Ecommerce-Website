import 'package:flutter/material.dart';

// 1. DeviceType Enum
enum DeviceType { mobile, mobileLandscape, tablet, tabletLandscape, desktop }

// 2. Breakpoints for responsiveness (remain as is)
const double _mobileBreakpoint = 600.0;
const double _tabletBreakpoint = 1000.0;

// 3. Utility function to get base DeviceCategory (without orientation) (remain as is)
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

// ⭐ NEW: Extension on BuildContext for easy device type checks ⭐
extension DeviceTypeExtension on BuildContext {
  DeviceType get baseDeviceCategory => getDeviceType(this);
  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isMobile => baseDeviceCategory == DeviceType.mobile && orientation == Orientation.portrait;
  bool get isMobileLandscape => baseDeviceCategory == DeviceType.mobile && orientation == Orientation.landscape;
  bool get isTablet => baseDeviceCategory == DeviceType.tablet && orientation == Orientation.portrait;
  bool get isTabletLandscape => baseDeviceCategory == DeviceType.tablet && orientation == Orientation.landscape;
  bool get isDesktop => baseDeviceCategory == DeviceType.desktop;
}

// ⭐ CORRECTED & ENHANCED: 11. ResponsiveValue Utility ⭐
// This is the core utility that new widgets will use to get device-specific values.
class ResponsiveValue<T> {
  final T mobile;
  final T? mobileLandscape;
  final T? tablet;
  final T? tabletLandscape;
  final T? desktop;

  const ResponsiveValue({
    required this.mobile,
    this.mobileLandscape,
    this.tablet,
    this.tabletLandscape,
    this.desktop,
  });

  // This method correctly retrieves the value based on the current device and orientation.
  T getValue(BuildContext context) {
    final DeviceType baseDeviceCategory = context.baseDeviceCategory;
    final Orientation orientation = context.orientation;

    switch (baseDeviceCategory) {
      case DeviceType.mobile:
        if (orientation == Orientation.landscape && mobileLandscape != null) {
          return mobileLandscape!;
        }
        return mobile;
      case DeviceType.tablet:
        if (orientation == Orientation.landscape && tabletLandscape != null) {
          return tabletLandscape!;
        }
        return tablet ?? mobile; // Fallback to mobile if tablet value not provided
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile; // Fallback sequence
      case DeviceType.mobileLandscape: // These cases should be covered by the logic above,
      case DeviceType.tabletLandscape: // but keep for completeness based on enum.
        return mobile; // Default fallback to mobile if somehow reached directly
    }
  }
}

// 4. ResponsiveVisibility Widget (retained as is, logic relies on getDeviceType directly)
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

// 5. ResponsiveSizedBox Widget (retained as is, logic relies on direct percentages/fixed values)
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

// 6. CustomPadding Widget (retained as is)
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

// 7. ResponsiveText Widget (retained as is, logic relies on getDeviceType directly)
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

// 8. ResponsiveConstraintBox Widget (retained as is)
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

// 9. ResponsiveSpacer Widget (retained as is)
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

// 10. ResponsiveBuilder Widget (retained as is)
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
    final DeviceType deviceType = getDeviceType(context);
    final Orientation orientation = MediaQuery.of(context).orientation;
    return builder(context, deviceType, orientation);
  }
}


// ⭐ CORRECTED & ENHANCED: 12. ResponsiveLayoutGrid Widget ⭐
// Now correctly uses the updated ResponsiveValue for columns
class ResponsiveLayoutGrid extends StatelessWidget {
  final List<Widget> children;
  final ResponsiveValue<int> columns; // Use ResponsiveValue here!
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double? childAspectRatio;

  const ResponsiveLayoutGrid({
    super.key,
    required this.children,
    // Provide sensible defaults for columns if not specified
    this.columns = const ResponsiveValue<int>(
      mobile: 1,
      mobileLandscape: 2,
      tablet: 2,
      tabletLandscape: 3,
      desktop: 4,
    ),
    this.mainAxisSpacing = 8.0, // Default for convenience
    this.crossAxisSpacing = 8.0, // Default for convenience
    this.childAspectRatio = 1.0, // Default for convenience
  });

  @override
  Widget build(BuildContext context) {
    final int currentColumns = columns.getValue(context); // Get the resolved column count

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: currentColumns,
        mainAxisSpacing: mainAxisSpacing!,
        crossAxisSpacing: crossAxisSpacing!,
        childAspectRatio: childAspectRatio!,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );
  }
}

// ⭐ NEW: CustomPageView Widget ⭐
// A responsive PageView that simplifies configuration based on device type.
class CustomPageView extends StatelessWidget {
  final PageController? controller;
  final IndexedWidgetBuilder itemBuilder;
  final int? itemCount;
  final ValueChanged<int>? onPageChanged;
  final Axis scrollDirection;
  final bool pageSnapping;
  final bool reverse;
  final ScrollPhysics? physics;

  // These parameters now directly take a ResponsiveValue object
  final ResponsiveValue<double> viewportFraction;
  final ResponsiveValue<double>? widthPercentage;
  final ResponsiveValue<double>? heightPercentage;


  // Private constructor to allow named constructors
  const CustomPageView._internal({
    super.key,
    this.controller,
    required this.itemBuilder,
    this.itemCount,
    this.onPageChanged,
    this.scrollDirection = Axis.horizontal,
    this.pageSnapping = true,
    this.reverse = false,
    this.physics,
    required this.viewportFraction,
    this.widthPercentage,
    this.heightPercentage,
  });

  // Default constructor for most custom scenarios
  const CustomPageView({
    super.key,
    this.controller,
    required this.itemBuilder,
    this.itemCount,
    this.onPageChanged,
    this.scrollDirection = Axis.horizontal,
    this.pageSnapping = true,
    this.reverse = false,
    this.physics,
    // Provide a default ResponsiveValue for viewportFraction
    this.viewportFraction = const ResponsiveValue<double>(
      mobile: 1.0, // Default: full page on mobile
      tablet: 0.8, // Default: shows 80% on tablet (hinting next page)
      desktop: 0.5, // Default: shows 50% on desktop (two pages side-by-side)
    ),
    this.widthPercentage,
    this.heightPercentage,
  }) : super();

  // Named constructor for a common "full-width, responsive height" carousel.
  factory CustomPageView.responsive({
    Key? key,
    PageController? controller,
    required IndexedWidgetBuilder itemBuilder,
    int? itemCount,
    ValueChanged<int>? onPageChanged,
    Axis scrollDirection = Axis.horizontal,
    bool pageSnapping = true,
    bool reverse = false,
    ScrollPhysics? physics,
    // Default viewport fractions for this common responsive pattern
    double mobileViewportFraction = 1.0,
    double mobileLandscapeViewportFraction = 0.9,
    double tabletViewportFraction = 0.8,
    double tabletLandscapeViewportFraction = 0.7,
    double desktopViewportFraction = 0.5,
    // Default heights as percentages for this common responsive pattern
    double mobileHeightPercentage = 0.4, // e.g., 40% of screen height
    double mobileLandscapeHeightPercentage = 0.6,
    double tabletHeightPercentage = 0.5, // e.g., 50% of screen height
    double tabletLandscapeHeightPercentage = 0.7,
    double desktopHeightPercentage = 0.6, // e.g., 60% of screen height
  }) {
    return CustomPageView._internal(
      key: key,
      controller: controller,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      onPageChanged: onPageChanged,
      scrollDirection: scrollDirection,
      pageSnapping: pageSnapping,
      reverse: reverse,
      physics: physics,
      viewportFraction: ResponsiveValue<double>(
        mobile: mobileViewportFraction,
        mobileLandscape: mobileLandscapeViewportFraction,
        tablet: tabletViewportFraction,
        tabletLandscape: tabletLandscapeViewportFraction,
        desktop: desktopViewportFraction,
      ),
      widthPercentage: const ResponsiveValue<double>(
        mobile: 1.0, mobileLandscape: 1.0, tablet: 1.0, tabletLandscape: 1.0, desktop: 1.0,
      ),
      heightPercentage: ResponsiveValue<double>(
        mobile: mobileHeightPercentage,
        mobileLandscape: mobileLandscapeHeightPercentage,
        tablet: tabletHeightPercentage,
        tabletLandscape: tabletLandscapeHeightPercentage,
        desktop: desktopHeightPercentage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Resolve the current viewportFraction based on device type
    final double currentViewportFraction = viewportFraction.getValue(context);

    // Resolve the current width and height percentages/fixed values
    double? resolvedWidth;
    double? resolvedHeight;

    if (widthPercentage != null) {
      resolvedWidth = widthPercentage!.getValue(context) * MediaQuery.of(context).size.width;
    } 

    if (heightPercentage != null) {
      resolvedHeight = heightPercentage!.getValue(context) * MediaQuery.of(context).size.height;
    } 

    return ResponsiveSizedBox(
      fixedWidth: resolvedWidth,
      fixedHeight: resolvedHeight,
      child: PageView.builder(
        controller: controller ?? PageController(viewportFraction: currentViewportFraction),
        itemBuilder: itemBuilder,
        itemCount: itemCount,
        onPageChanged: onPageChanged,
        scrollDirection: scrollDirection,
        pageSnapping: pageSnapping,
        reverse: reverse,
        physics: physics,
      ),
    );
  }
}

// ⭐ NEW: ResponsiveIcon Widget ⭐
class ResponsiveIcon extends StatelessWidget {
  final IconData icon;
  final ResponsiveValue<double> size;
  final Color? color;

  const ResponsiveIcon({
    super.key,
    required this.icon,
    required this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double currentSize = size.getValue(context);
    return Icon(
      icon,
      size: currentSize,
      color: color,
    );
  }
}

// ⭐ NEW: ResponsiveButton Widget ⭐
class ResponsiveButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final ResponsiveValue<EdgeInsetsGeometry>? padding;
  final ResponsiveValue<TextStyle>? textStyle;

  const ResponsiveButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.style,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry? effectivePadding = padding?.getValue(context);
    final TextStyle? effectiveTextStyle = textStyle?.getValue(context);

    ButtonStyle? buttonStyle = style;
    if (effectivePadding != null) {
      buttonStyle = (buttonStyle ?? const ButtonStyle()).copyWith(
        padding: WidgetStateProperty.all(effectivePadding),
      );
    }
    if (effectiveTextStyle != null) {
      buttonStyle = (buttonStyle ?? const ButtonStyle()).copyWith(
        textStyle: WidgetStateProperty.all(effectiveTextStyle),
      );
    }

    return ElevatedButton( // Default to ElevatedButton
      onPressed: onPressed,
      style: buttonStyle,
      child: child,
    );
  }
}

// ⭐ NEW: ResponsiveIconButton Widget ⭐
class ResponsiveIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final ResponsiveValue<double> iconSize;
  final ResponsiveValue<EdgeInsetsGeometry>? padding;
  final Color? color;
  final String? tooltip; // Corrected to String? for IconButton tooltip

  const ResponsiveIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.iconSize,
    this.padding,
    this.color,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveIconSize = iconSize.getValue(context);
    final EdgeInsetsGeometry? effectivePadding = padding?.getValue(context);

    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: effectiveIconSize),
      padding: effectivePadding,
      color: color,
      tooltip: tooltip,
    );
  }
}
