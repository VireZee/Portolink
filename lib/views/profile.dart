part of 'views.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  final ft = FToast();
  bool load = false;
  final CollectionReference uCollection = FirebaseFirestore.instance.collection('Users');
  @override
  void initState() {
    super.initState();
    ft.init(context);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
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
            }
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
          },
          icon: const Icon(Icons.logout),
          label: const Text('Sign Out')
        ),
        ElevatedButton.icon(
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
            }
            setState(() {
              load = true;
            });
            await Auth.deleteAccount().then((value) {
              if (value == true) {
                setState(() {
                  load = false;
                });
                ft.showToast(
                  child: Activity.showToast(
                    'Goodbye',
                    Colors.blue
                  ),
                  toastDuration: const Duration(seconds: 1),
                  fadeDuration: 200
                );
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
          },
          icon: const Icon(Icons.clear),
          label: const Text('Delete Account')
        )
      ]
    );
  }
}