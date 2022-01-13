part of 'views.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  bool on = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login.jfif'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
            )
          )
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 50),
              Flexible(
                child: Center(
                  child: Text(
                    'Portolink',
                    style: GoogleFonts.dancingScript(
                      color: Colors.blue[700],
                      fontSize: 60,
                      fontWeight: FontWeight.w100
                    )
                  )
                )
              ),
              const SizedBox(height: 25),
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
                  child: const Center(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
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
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    )
                  )
                )
              ),
              const SizedBox(height: 100)
            ]
          )
        )
      ]
    );
  }
}