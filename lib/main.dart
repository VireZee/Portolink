import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart'; 
import 'package:portolink/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:portolink/views/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final bool light = true;
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme:  MyTheme.darkTheme(),
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: light ? MyTheme.lightTheme() : MyTheme.darkTheme(),
          darkTheme: MyTheme.darkTheme(),
          initialRoute: '/',
          routes: {
            Splash.routeName: (context) => const Splash(),
            SignIn.routeName: (context) => const SignIn(),
            SignUp.routeName: (context) => const SignUp(),
            MainMenu.routeName: (context) => const MainMenu()
          }
        )
      ),
    );
  }
}
          