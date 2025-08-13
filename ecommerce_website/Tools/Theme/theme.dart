import 'package:flutter/material.dart';

abstract class AppColors {
  Color get accent1;
  Color get accent2;
  Color get accent3;
  Color get accent4;

  Color get primaryText;
  Color get secondaryText;

  Color get primaryBackground;
  Color get secondaryBackground;
  Color get surfaceColor;

  Color get error;
  Color get warning;

  Color get color1;
  Color get color2;
  Color get color3;
  Color get color4;
  Color get color5;
  Color get color6;

  Color get onPrimary;
  Color get onSecondary;
  Color get onSurface;
  Color get onBackground;
  Color get onError;
  Color get onWarning;
}

class LightAppColors implements AppColors {
  @override
  Color get accent1 => const Color(0xFF6200EE);
  @override
  Color get accent2 => const Color(0xFF03DAC6);
  @override
  Color get accent3 => const Color(0xFFFFC107);
  @override
  Color get accent4 => const Color(0xFF2196F3);

  @override
  Color get primaryText => Colors.black87;
  @override
  Color get secondaryText => Colors.black54;

  @override
  Color get primaryBackground => const Color(0xFFF0F2F5);
  @override
  Color get secondaryBackground => const Color(0xFFFFFFFF);
  @override
  Color get surfaceColor => const Color(0xFFFFFFFF);

  @override
  Color get error => const Color(0xFFB00020);
  @override
  Color get warning => const Color(0xFFFFCC00);

  @override
  Color get color1 => const Color(0xFF4CAF50);
  @override
  Color get color2 => const Color(0xFFE91E63);
  @override
  Color get color3 => const Color(0xFF9C27B0);
  @override
  Color get color4 => const Color(0xFF00BCD4);
  @override
  Color get color5 => const Color(0xFFCDDC39);
  @override
  Color get color6 => const Color(0xFF795548);

  @override
  Color get onPrimary => Colors.white;
  @override
  Color get onSecondary => Colors.black;
  @override
  Color get onSurface => Colors.black;
  @override
  Color get onBackground => Colors.black;
  @override
  Color get onError => Colors.white;
  @override
  Color get onWarning => Colors.black;
}

class DarkAppColors implements AppColors {
  @override
  Color get accent1 => Colors.white;
  @override
  Color get accent2 => const Color(0xFF9B9B9B);
  @override
  Color get accent3 => const Color(0xFFBB86FC);
  @override
  Color get accent4 => const Color(0xFF03DAC6);

  @override
  Color get primaryText => Colors.white;
  @override
  Color get secondaryText => Colors.white70;

  @override
  Color get primaryBackground => const Color(0xFF0A0A0A);
  @override
  Color get secondaryBackground => const Color(0xFF181818);
  @override
  Color get surfaceColor => const Color(0xFF1E1E1E);

  @override
  Color get error => const Color(0xFFCF6679);
  @override
  Color get warning => const Color(0xFFFFCC00);

  @override
  Color get color1 => const Color(0xFF66BB6A);
  @override
  Color get color2 => const Color(0xFFEC407A);
  @override
  Color get color3 => const Color(0xFFAB47BC);
  @override
  Color get color4 => const Color(0xFF26C6DA);
  @override
  Color get color5 => const Color(0xFFD4E157);
  @override
  Color get color6 => const Color(0xFF8D6E63);

  @override
  Color get onPrimary => Colors.black;
  @override
  Color get onSecondary => Colors.black;
  @override
  Color get onSurface => Colors.white;
  @override
  Color get onBackground => Colors.white;
  @override
  Color get onError => Colors.black;
  @override
  Color get onWarning => Colors.black;
}

TextTheme _buildAppTextTheme(AppColors colors) {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: colors.onSurface,
    ),
    displayMedium: TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: colors.onSurface,
    ),
    displaySmall: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      color: colors.onSurface,
    ),
    headlineLarge: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: colors.onSurface,
    ),
    headlineMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: colors.primaryText,
    ),
    headlineSmall: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
      color: colors.primaryText,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
      color: colors.primaryText,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: colors.secondaryText,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.05,
      color: colors.primaryText,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: colors.secondaryText,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: colors.secondaryText,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: colors.secondaryText,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: colors.primaryText,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.8,
      color: colors.primaryText,
    ),
    labelSmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.8,
      color: colors.secondaryText,
    ),
  );
}

ThemeData buildAppTheme(Brightness brightness) {
  final AppColors colors = brightness == Brightness.light
      ? LightAppColors()
      : DarkAppColors();
  final TextTheme appTextTheme = _buildAppTextTheme(colors);

  return ThemeData(
    brightness: brightness,
    colorScheme: ColorScheme(
      primary: colors.accent1,
      primaryContainer: colors.surfaceColor,
      secondary: colors.accent2,
      secondaryContainer: colors.surfaceColor,
      surface: colors.surfaceColor,
      // REMOVED deprecated 'background' parameter from ColorScheme constructor
      error: colors.error,
      onPrimary: colors.onPrimary,
      onSecondary: colors.onSecondary,
      onSurface: colors.onSurface,
      // REMOVED deprecated 'onBackground' parameter from ColorScheme constructor
      onError: colors.onError,
      brightness: brightness,
    ),
    scaffoldBackgroundColor: colors.primaryBackground,
    textTheme: appTextTheme,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      foregroundColor: colors.primaryText,
      elevation: 0.0,
      titleTextStyle: appTextTheme.labelMedium?.copyWith(
        color: colors.primaryText,
      ),
      iconTheme: IconThemeData(color: colors.primaryText),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.surfaceColor.withAlpha((255 * 0.5).round()),
        foregroundColor: colors.primaryText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: colors.primaryText.withAlpha((255 * 0.2).round()),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        elevation: 0.0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: colors.primaryText),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.primaryText,
        side: BorderSide(
          color: colors.primaryText.withAlpha((255 * 0.2).round()),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: colors.secondaryText.withAlpha((255 * 0.3).round()),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: colors.primaryText, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: colors.secondaryText.withAlpha((255 * 0.2).round()),
        ),
      ),
      labelStyle: TextStyle(color: colors.secondaryText),
      hintStyle: TextStyle(color: colors.secondaryText),
      fillColor: colors.surfaceColor.withAlpha((255 * 0.5).round()),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
    ),
    cardTheme: CardThemeData(
      color: colors.surfaceColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: colors.primaryText.withAlpha((255 * 0.2).round()),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: colors.primaryText, size: 24.0),
    dividerTheme: DividerThemeData(
      color: colors.secondaryText.withAlpha((255 * 0.2).round()),
      thickness: 0.5,
      space: 24.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.accent1,
      foregroundColor: colors.onPrimary,
      elevation: 6.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colors.surfaceColor,
      selectedItemColor: colors.primaryText,
      unselectedItemColor: colors.secondaryText,
      type: BottomNavigationBarType.fixed,
      elevation: 8.0,
      selectedLabelStyle: appTextTheme.labelSmall,
      unselectedLabelStyle: appTextTheme.labelSmall,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: colors.surfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      titleTextStyle: appTextTheme.titleLarge?.copyWith(
        color: colors.primaryText,
      ),
      contentTextStyle: appTextTheme.bodyMedium?.copyWith(
        color: colors.secondaryText,
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(
        colors.secondaryText.withAlpha((255 * 0.4).round()),
      ),
      radius: const Radius.circular(10),
      thickness: WidgetStateProperty.all(6.0),
    ),
  );
}

extension AppThemeColors on BuildContext {
  AppColors get appColors => Theme.of(this).brightness == Brightness.light
      ? LightAppColors()
      : DarkAppColors();

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get accent1 => appColors.accent1;
  Color get accent2 => appColors.accent2;
  Color get accent3 => appColors.accent3;
  Color get accent4 => appColors.accent4;

  Color get primaryText => appColors.primaryText;
  Color get secondaryText => appColors.secondaryText;

  // FIX: These directly reference appColors properties, avoiding deprecated ColorScheme.background/onBackground
  Color get primaryBackground => appColors.primaryBackground;
  Color get secondaryBackground => appColors.secondaryBackground;
  Color get surfaceColor => appColors.surfaceColor;

  Color get errorColor => appColors.error;
  Color get warningColor => appColors.warning;

  Color get color1 => appColors.color1;
  Color get color2 => appColors.color2;
  Color get color3 => appColors.color3;
  Color get color4 => appColors.color4;
  Color get color5 => appColors.color5;
  Color get color6 => appColors.color6;

  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get onSurfaceColor => colorScheme.onSurface;
  // FIX: This directly references appColors.onBackground
  Color get onBackgroundColor => appColors.onBackground;
  Color get onErrorColor => colorScheme.onError;
  Color get onWarningColor => appColors.onWarning;
}

extension AppTextStyles on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;
}
