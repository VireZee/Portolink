part of 'views.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String routeName = '/in';
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool vis = true;
  bool load = false;
  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPass.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signin_bg.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
              )
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Flexible(
                    child: Center(
                      child: Column(
                        children: const [
                          Spacer(flex: 10),
                          Text(
                            'Portolink',
                            style: TextStyle(
                              fontFamily: 'Dancing Script',
                              color: Color(0xFF0000FF),
                              fontSize: 80
                            )
                          ),
                          Spacer()
                        ]
                      )
                    )
                  ),
                  const Flexible(
                    child: Center(
                      child: Text(
                        'SIGN IN',
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
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: TextField(
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
                            hintText: 'Email'
                          ),
                          controller: ctrlEmail,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next
                        )
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: TextField(
                          style: const TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Icon(
                                FontAwesomeIcons.lock,
                                size: 28
                              )
                            ),
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  vis = !vis;
                                });
                              },
                              child: Icon(
                                vis
                                ? Icons.visibility
                                : Icons.visibility_off,
                              )
                            )
                          ),
                          obscureText: vis,
                          controller: ctrlPass,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        )
                      )
                    )
                  ),
                  Row(
                    children: const [
                      Spacer(flex: 10),
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15
                        )
                      ),
                      Spacer()
                    ]
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton.icon(
                      onPressed: ctrlEmail.text.isNotEmpty && ctrlPass.text.isNotEmpty
                      ? () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            load = true;
                          });
                          final String msg = await Auth.signIn(ctrlEmail.text, ctrlPass.text);
                          if (msg == 'Signed') {
                            setState(() {
                              load = false;
                            });
                            Activity.showToast(null.toString(), Colors.blue);
                            Navigator.pushReplacementNamed(context, MainMenu.routeName);
                          }
                          else if (msg == 'None') {
                            setState(() {
                              load = false;
                            });
                            Activity.showToast('Email is not exist', const Color(0xFFFF0000));
                          }
                          else if (msg == 'Hacker') {
                            setState(() {
                              load = false;
                            });
                            Activity.showToast('Password is wrong', const Color(0xFFFF0000));
                          }
                          else if (msg == 'Invalid Email') {
                            setState(() {
                              load = false;
                            });
                            Activity.showToast('Email is invalid', const Color(0xFFFF0000));
                          }
                          else if (msg == 'Disabled') {
                            setState(() {
                              load = false;
                            });
                            Activity.showToast('This email has been disabled', const Color(0xFFFF0000));
                          }
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
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        )
                      ),
                      icon: const Icon(Icons.login),
                      label: Row(
                        children: const [
                          Spacer(),
                          Text(
                            'SIGN IN',
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
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignUp.routeName);
                    },
                    child: const Text(
                      'Create New Account',
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