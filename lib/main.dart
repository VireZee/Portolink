import 'package:flutter/services.dart';
import 'package:portolink/shared/shared.dart';
import 'package:portolink/views/views.dart';
import 'package:flutter/material.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme(),
      home: const Login()
    );
  }
}