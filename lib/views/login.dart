part of 'views.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
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
              image: AssetImage('assets/login_bg.jfif'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
            )
          )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 10),
              Flexible(
                child: Center(
                  child: Column(
                    children: [
                      const Spacer(flex: 50),
                      Text(
                        'Portolink',
                        style: GoogleFonts.dancingScript(
                          color: Colors.blue[700],
                          fontSize: 60,
                          fontWeight: FontWeight.w100
                        )
                      ),
                      const Spacer()
                    ]
                  )
                )
              ),
              Flexible(
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w300
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
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Icon(
                            FontAwesomeIcons.envelope,
                            size: 28,
                            color: Colors.white
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
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Icon(
                            FontAwesomeIcons.lock,
                            size: 28,
                            color: Colors.white
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
                            color: Colors.white
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
                children: [
                  const Spacer(flex: 10),
                  Text(
                    'Forgot Password',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.white
                    )
                  ),
                  const Spacer()
                ]
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    )
                  ),
                  icon: const Icon(Icons.login),
                  label: Row(
                    children: [
                      const Spacer(),
                      Text(
                        'LOGIN',
                        style: GoogleFonts.prompt(fontSize: 20)
                      ),
                      const Spacer(flex: 2)
                    ]
                  )
                )
              ),
              const SizedBox(height: 30),
              Container(
                child: Text(
                  'Create New Account',
                  style: GoogleFonts.shadowsIntoLight(
                    fontSize: 25,
                    color: Colors.white
                  )
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.white
                    )
                  )
                )
              ),
              const SizedBox(height: 50)
            ]
          )
        )
      ]
    );
  }
}