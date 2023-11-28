
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amcmotion/api/chat_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';

void main() => runApp(
    MotionApp(chatApi: ChatApi())
);

class MotionApp extends StatelessWidget {
  const MotionApp({super.key, required this.chatApi});

  final ChatApi chatApi;

  static const appTitle = 'AMC MOTION';

  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color(0xFF0088f4);
    Color secondaryColor = const Color(0xFFFFFFFF);
    Color surfaceColor = const Color(0xFF3E6D6F);
    Color errorColor = const Color(0xFFFF0000);
    Color backgroundColor = const Color(0xFFFFFFFF);
    Color darkBackgroundColor = const Color(0xFF000000);
    Color primaryContainerColor = const Color(0xFF333333);
    Color darkPrimaryContainerColor = const Color(0xFF000000);
    Color secondaryContainerColor = Colors.orange;
    Color colorSeed = const Color(0xFF3E6D6F);

    var brightness = View.of(context).platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (kDebugMode) {
      print('isDarkMode : $isDarkMode');
    }

    final lightColorScheme = ColorScheme.fromSeed(
        primary: primaryColor,
        primaryContainer: primaryContainerColor,
        secondary: secondaryColor,
        background: backgroundColor,
        surface: surfaceColor,
        error: errorColor,
        secondaryContainer: secondaryContainerColor,
        onPrimary: primaryColor,
        onPrimaryContainer: primaryContainerColor,
        onSecondary: secondaryColor,
        onSecondaryContainer: secondaryContainerColor,
        onSurface: surfaceColor,
        onBackground: backgroundColor,
        onError: errorColor,
        brightness: Brightness.light,
        seedColor: colorSeed
      );
    final darkColorScheme = ColorScheme.fromSeed(
        primary: primaryColor,
        primaryContainer: primaryContainerColor,
        secondary: secondaryColor,
        background: darkBackgroundColor,
        surface: surfaceColor,
        error: errorColor,
        secondaryContainer: secondaryContainerColor,
        onPrimary: primaryColor,
        onPrimaryContainer: darkPrimaryContainerColor,
        onSecondary: secondaryColor,
        onSecondaryContainer: secondaryContainerColor,
        onSurface: surfaceColor,
        onBackground: backgroundColor,
        onError: errorColor,
        brightness: Brightness.dark,
        seedColor: colorSeed
    );

    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            );
          }
          return BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ); // Defer to the widget's default.
        },
      ),
    );

    OutlinedButton(
      style: outlineButtonStyle,
      onPressed: () { },
      child: const Text('Looks like an OutlineButton'),
    );

    final ThemeData appTheme = ThemeData.from(
        useMaterial3: true,
        colorScheme: (isDarkMode ? darkColorScheme : lightColorScheme),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Merriweather-Bold',
            color: Colors.white,
          ),
          // ···
          displayMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Merriweather-Bold',
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontFamily: 'georgia',
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 32,
            fontFamily: 'georgia',
            height: 40 / 32,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 28,
            fontFamily: 'georgia',
            height: 36 / 28,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 24,
            fontFamily: 'georgia',
            height: 32 / 24,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            fontFamily: 'Merriweather-Bold',
            color: Colors.black87,
            height: 28 / 22,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Merriweather-Bold',
            height: 24 / 16,
            color: Colors.black87,
            letterSpacing: 0.1,
          ),
          titleSmall:  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: 'Merriweather-Bold',
            height: 20 / 14,
            letterSpacing: 0.1,
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            fontFamily: 'Merriweather-Bold',
            height: 20 / 14,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Colors.white,
            fontFamily: 'Merriweather-Bold',
            height: 16 / 12,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Colors.white,
            fontFamily: 'Merriweather-Bold',
            height: 16 / 11,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: 'georgia',
            height: 24 / 16,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            fontFamily: 'georgia',
            color: Colors.black87,
            height: 20 / 14,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 9,
            fontFamily: 'georgia',
            color: Colors.white,
            height: 16 / 12,
          ),
        )
    ).copyWith(
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.normal,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(width: 2.0, color: Colors.white)
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          // Background color
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return Colors.blue.shade700;
              return Colors.blue;  // Default color
            },
          ),
          // Text color
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // Padding
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
          ),
          // Shape
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
    final ThemeData darkTheme = ThemeData.from(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Merriweather-Bold',
            color: Colors.white,
          ),
          // ···
          displayMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Merriweather-Bold',
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontFamily: 'georgia',
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 32,
            fontFamily: 'georgia',
            height: 40 / 32,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 28,
            fontFamily: 'georgia',
            height: 36 / 28,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 24,
            fontFamily: 'georgia',
            height: 32 / 24,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            fontFamily: 'Merriweather-Bold',
            color: Colors.black87,
            height: 28 / 22,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Merriweather-Bold',
            height: 24 / 16,
            color: Colors.black87,
            letterSpacing: 0.1,
          ),
          titleSmall:  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: 'Merriweather-Bold',
            height: 20 / 14,
            letterSpacing: 0.1,
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            fontFamily: 'Merriweather-Bold',
            height: 20 / 14,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Colors.white,
            fontFamily: 'Merriweather-Bold',
            height: 16 / 12,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Colors.white,
            fontFamily: 'Merriweather-Bold',
            height: 16 / 11,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: 'georgia',
            height: 24 / 16,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            fontFamily: 'georgia',
            color: Colors.black87,
            height: 20 / 14,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 9,
            fontFamily: 'georgia',
            color: Colors.white,
            height: 16 / 12,
          ),
        )
    ).copyWith(
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.normal,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(width: 2.0, color: Colors.white)
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          // Background color
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return Colors.blue.shade700;
              return Colors.blue;  // Default color
            },
          ),
          // Text color
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // Padding
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
          ),
          // Shape
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );

    return MaterialApp(
      title: appTitle,
      theme: appTheme,
      home: HomePage(title: appTitle, chatApi: chatApi),
    );
  }
}
