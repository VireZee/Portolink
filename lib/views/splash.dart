part of 'views.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  final ft = FToast();
  @override
  void initState() {
    super.initState();
    _loadSplash();
    ft.init(context);
  }
  _loadSplash() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, checkAuth);
  }
  void checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Navigator.pushReplacementNamed(context, MainMenu.routeName);
      ft.showToast(
        child: Activity.showToast(
          'Welcome Back',
          Colors.blue
        ),
        toastDuration: const Duration(seconds: 1),
        fadeDuration: 200
      );
    } else {
      Navigator.pushReplacementNamed(context, SignIn.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/auth.json')
        ]
      )
    );
  }
}