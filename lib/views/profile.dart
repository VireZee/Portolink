part of 'views.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  bool load = false;
  final CollectionReference uCollection = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final net = await (Connectivity().checkConnectivity());
        if (net == ConnectivityResult.none) {
          Activity.showToast('No internet connection', const Color(0xFFFF0000));
        }
        setState(() {
          load = true;
        });
        await Auth.signOut().then((value) {
          if (value == true) {
            setState(() {
              load = false;
            });
            Activity.showToast('Signed out', Colors.blue);
            Navigator.pushReplacementNamed(context, Login.routeName);
          } else {
            setState(() {
              load = false;
            });
            Activity.showToast('No internet connection', const Color(0xFFFF0000));
          }
        });
      },
      icon: const Icon(Icons.logout),
      label: const Text('Sign out')
    );
  }
}