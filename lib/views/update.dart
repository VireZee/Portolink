part of 'views.dart';

class Update extends StatefulWidget {
  const Update({Key? key, required this.uid, required this.name, required this.phone, required this.email}) : super(key: key);
  final String uid;
  final String name;
  final String phone;
  final String email;
  @override
  _UpdateState createState() => _UpdateState();
}
class _UpdateState extends State<Update> {
  final ft = FToast();
  static bool load = false;
  static bool c = true;
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlEmail = TextEditingController();
  @override
  void initState() {
    ctrlName.text =  widget.name;
    ctrlPhone.text = widget.phone;
    ctrlEmail.text = widget.email;
    super.initState();
  }
  @override
  void dispose() {
    ctrlName.dispose();
    ctrlPhone.dispose();
    ctrlEmail.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/edit_bg.jpg'),
                fit: BoxFit.fill
              )
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: const BackButton(),
                backgroundColor: Colors.transparent,
                toolbarHeight: 75,
                elevation: 0,
                actions: [
                  const Spacer(flex: 25),
                  ThemeSwitcher(
                    builder: (context) => IconButton(
                      onPressed: () {
                        setState(() {
                          c = !c;
                        });
                        ThemeSwitcher.of(context).changeTheme(
                          theme: ThemeModelInheritedNotifier.of(context).theme.brightness == Brightness.dark
                          ? MyTheme.lightTheme()
                          : MyTheme.darkTheme()
                        );
                      },
                      icon: c ? const Icon(CupertinoIcons.sun_max_fill) : const Icon(CupertinoIcons.moon_stars_fill),
                      color: c ? Colors.white : Colors.black
                    )
                  ),
                  const Spacer()
                ]
              ),
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                physics: const BouncingScrollPhysics(),
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25
                          )
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: ctrlName,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                            fontFamily: 'Flamenco',
                            fontSize: 30
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                          ),
                          maxLines: 1
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: const SweepGradient(
                                  colors: [
                                    Color(0xFF00FF00),
                                    Colors.cyan,
                                    Color(0xFF0000FF),
                                    Colors.purple,
                                    Color(0xFFFF0000),
                                    Colors.yellow,
                                    Colors.yellow,
                                    Color(0xFFFF0000),
                                    Colors.purple,
                                    Color(0xFF0000FF),
                                    Colors.cyan,
                                    Color(0xFF00FF00)
                                  ]
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Spacer(),
                                  Icon(Icons.update),
                                  Spacer(flex: 4),
                                  Text('Update Profile'),
                                  Spacer(flex: 5),
                                  Spacer()
                                ]
                              )
                            )
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            )
          );
        }
      )
    );
  }
}