part of 'views.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);
  static const String routeName = '/for';
  @override
  _ForgotState createState() => _ForgotState();
}
class _ForgotState extends State<Forgot> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController ctrlEmail = TextEditingController();
  final FToast ft = FToast();
  bool load = false;
  bool btn = true;
  bool isEmpty() {
    setState(() {
      if (ctrlEmail.text != '') {
        btn = true;
      }
      else {
        btn = false;
      }
    });
    return btn;
  }
  @override
  void initState() {
    super.initState();
    ft.init(context);
  }
  @override
  void dispose() {
    ctrlEmail.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/begin_bg.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
              )
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: <Widget>[
                  const Flexible(
                    child: Center(
                      child: Text(
                        'EMAIL',
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 60
                        )
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: TextField(
                          onChanged: (value) => isEmpty(),
                          style: const TextStyle(fontSize: 25),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                                size: 28
                              )
                            ),
                            hintText: 'Enter your Email'
                          ),
                          controller: ctrlEmail,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done
                        )
                      )
                    )
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton.icon(
                      onPressed: isEmpty()
                      ? () async {
                        setState(() => load = true);
                        FocusScope.of(context).requestFocus(FocusNode());
                        final ConnectivityResult net = await (Connectivity().checkConnectivity());
                        final bool sub = await InternetConnectionChecker().hasConnection;
                        if (net == ConnectivityResult.none) {
                          setState(() => load = false);
                          ft.showToast(
                            child: Activity.showToast(
                              'No internet connection',
                              const Color(0xFFFF0000)
                            ),
                            toastDuration: const Duration(seconds: 1),
                            fadeDuration: 200
                          );
                        }
                        else if (ctrlEmail.text.isEmpty) {
                          setState(() => load = false);
                          ft.showToast(
                            child: Activity.showToast(
                              'Email can\'t be empty',
                              const Color(0xFFFF0000)
                            ),
                            toastDuration: const Duration(seconds: 1),
                            fadeDuration: 200
                          );
                        }
                        else if (sub) {}
                        else {
                          setState(() => load = false);
                          ft.showToast(
                            child: Activity.showToast(
                              'No internet connection',
                              const Color(0xFFFF0000)
                            ),
                            toastDuration: const Duration(seconds: 1),
                            fadeDuration: 200
                          );
                        }
                      }
                      : null,
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith((states) {
                          return states.contains(MaterialState.pressed)
                          ? Colors.blue
                          : null;
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith((states) {
                          return states.contains(MaterialState.pressed)
                          ? const Color(0xFF00FF00)
                          : null;
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                        )
                      ),
                      icon: const Icon(Icons.send),
                      label: Row(
                        children: const [
                          Spacer(),
                          Text(
                            'Reset Password',
                            style: TextStyle(
                              fontFamily: 'Prompt',
                              fontSize: 20
                            )
                          ),
                          Spacer(flex: 2)
                        ]
                      )
                    )
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/in'),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontFamily: 'Flamenco',
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1
                      )
                    )
                  ),
                  const SizedBox(height: 20)
                ]
              )
            )
          )
        ),
        load == true
        ? Activity.check()
        : Container()
      ]
    );
  }
}