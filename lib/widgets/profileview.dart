part of 'widgets.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, required this.users}) : super(key: key);
  final Users users;
  @override
  _ProfileViewState createState() => _ProfileViewState();
}
class _ProfileViewState extends State<ProfileView> {
  final ft = FToast();
  bool load = false;
  @override
  void initState() {
    super.initState();
    ft.init(context);
  }
  @override
  Widget build(BuildContext context) {
    Users users = widget.users;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/profile_bg.jpg'),
              fit: BoxFit.fill
            )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 75,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                const Spacer(flex: 25),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.moon_stars, color: Colors.white)
                ),
                const Spacer()
              ]
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Text(
                      users.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'Oswald', fontSize: 30)
                    ),
                    Text(
                      users.email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline, decorationThickness: 2)
                    ),
                    const SizedBox(height: 12),
                    Text(
                      users.phone,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'Dancing Script', fontSize: 25)
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Edit Profile'),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith((states) {
                          return states.contains(MaterialState.pressed)
                          ? Colors.blue
                          : null;
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 32))
                      )
                    ),
                    const SizedBox(height: 300),
                    SizedBox(
                      width: 350,
                      height: 40,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final net = await (Connectivity().checkConnectivity());
                          if (net == ConnectivityResult.none) {
                            ft.showToast(
                              child: Activity.showToast(
                                'No internet connection',
                                const Color(0xFFFF0000)
                              ),
                              toastDuration: const Duration(seconds: 1),
                              fadeDuration: 200
                            );
                          } else {
                            setState(() {
                              load = true;
                            });
                            await Auth.signOut().then((value) {
                              if (value == true) {
                                setState(() {
                                  load = false;
                                });
                                Navigator.pushReplacementNamed(context, SignIn.routeName);
                              } else {
                                setState(() {
                                  load = false;
                                });
                                ft.showToast(
                                  child: Activity.showToast(
                                    'No internet connection',
                                    const Color(0xFFFF0000)
                                  ),
                                  toastDuration: const Duration(seconds: 1),
                                  fadeDuration: 200
                                );
                              }
                            });
                          }
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text('Sign Out'),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                          )
                        )
                      )
                    )
                  ]
                )
              ]
            )
          ),
        ),
      ],
    );
  }
}