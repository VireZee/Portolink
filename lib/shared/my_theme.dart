part of 'shared.dart';

class MyTheme{
  static ThemeData lightTheme(){
    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.white),
      textTheme: const TextTheme(
        headline1: TextStyle(),
        headline2: TextStyle(),
        headline3: TextStyle(),
        headline4: TextStyle(),
        headline5: TextStyle(),
        headline6: TextStyle(),
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        subtitle1: TextStyle(),
        subtitle2: TextStyle(),
        button: TextStyle(),
        caption: TextStyle(),
        overline: TextStyle()
      ).apply(bodyColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white70), foregroundColor: MaterialStateProperty.all(Colors.black))),
      hintColor: Colors.white.withOpacity(0.2),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white)
    );
  }
  static ThemeData darkTheme(){
    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black),
      textTheme: const TextTheme(
        headline1: TextStyle(),
        headline2: TextStyle(),
        headline3: TextStyle(),
        headline4: TextStyle(),
        headline5: TextStyle(),
        headline6: TextStyle(),
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        subtitle1: TextStyle(),
        subtitle2: TextStyle(),
        button: TextStyle(),
        caption: TextStyle(),
        overline: TextStyle()
      ).apply(bodyColor: Colors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black), foregroundColor: MaterialStateProperty.all(Colors.white))),
      hintColor: Colors.black.withOpacity(0.2),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black)
    );
  }
}