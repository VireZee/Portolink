part of 'views.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Auth.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile_bg.jpg'),
                fit: BoxFit.fill
              )
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/no_net_bg.png'),
                  fit: BoxFit.fitWidth
                )
              )
            )
          );
        }
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile_bg.jpg'),
                fit: BoxFit.fill
              )
            ),
            child: Activity.loading()
          );
        }
        return ProfileView(users: snapshot.data as Users);
      }
    );
  }
}