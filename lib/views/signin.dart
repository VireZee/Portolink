part of 'views.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);
  static const String routeName = '/in';
  @override
  _SigninState createState() => _SigninState();
}
class _SigninState extends State<Signin> {
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool on = true;
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
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/signin_bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
            )
          )
        ),
        Scaffold(
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
                              on = !on;
                            });
                          },
                          child: Icon(
                            on
                            ? Icons.visibility
                            : Icons.visibility_off,
                          )
                        )
                      ),
                      obscureText: on,
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
                  ? () {}
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
                  Navigator.pushReplacementNamed(context, Signup.routeName);
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
      ]
    );
  }
}