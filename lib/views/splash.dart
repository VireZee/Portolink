part of 'views.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _loadSplash();
  }
  _loadSplash() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, checkAuth);
  }
  void checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Navigator.pushReplacementNamed(context, MainMenu.routeName);
      Activity.showToast('Welcome Back, ' + auth.currentUser!.email.toString(), Colors.blue);
    }
    Navigator.pushReplacementNamed(context, Signin.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/loading.json')
        ]
      )
    );
  }
}