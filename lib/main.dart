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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme(),
      initialRoute: '/',
      routes: {
        Splash.routeName: (context) => const Splash(),
        Signin.routeName: (context) => const Signin(),
        Signup.routeName: (context) => const Signup()
      }
    );
  }
}