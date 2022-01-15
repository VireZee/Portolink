part of 'views.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final ctrlName = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  final ctrlCPass = TextEditingController();
  bool on = true;
  @override
  void dispose() {
    ctrlName.dispose();
    ctrlPhone.dispose();
    ctrlEmail.dispose();
    ctrlPass.dispose();
    ctrlCPass.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/register_bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)
            )
          )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'REGISTER',
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
                            FontAwesomeIcons.user,
                            size: 28
                          )
                        ),
                        hintText: 'Name'
                      ),
                      controller: ctrlName,
                      keyboardType: TextInputType.name,
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
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Icon(
                            FontAwesomeIcons.phone,
                            size: 28
                          )
                        ),
                        hintText: 'Phone'
                      ),
                      controller: ctrlPhone,
                      keyboardType: TextInputType.phone,
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
                            size: 28,
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
                            FontAwesomeIcons.checkCircle,
                            size: 28
                          )
                        ),
                        hintText: 'Confirm Pass'
                      ),
                      obscureText: on,
                      controller: ctrlCPass,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    )
                  )
                )
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 170,
                child: ElevatedButton.icon(
                  onPressed: null,
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
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.disabled)
                      ? Colors.grey.withOpacity(0.7)
                      : null;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    )
                  ),
                  icon: const Icon(Icons.child_care),
                  label: Row(
                    children: const [
                      Spacer(),
                      Text(
                        'REGISTER',
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
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Login.routeName);
                },
                child: const Text(
                  'Already Have an Account',
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