part of 'shared.dart';

class MyTheme{
  static ThemeData lightTheme(){
    return ThemeData(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xFF14D7F3),
      hintColor: Colors.white.withOpacity(0.2),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white)
    );
  }
  static ThemeData darkTheme(){
    return ThemeData(
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color(0xFF14D7F3),
      hintColor: Colors.black.withOpacity(0.2),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black)
    );
  }
}