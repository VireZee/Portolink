part of 'views.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future getUser() async {
    await FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid).get().then((DocumentSnapshot doc) async {
      final Users users = Users (
        doc['uid'],
        doc['photo'],
        doc['name'],
        doc['phone'],
        doc['email'],
        doc['password'],
        doc['created'],
        doc['updated'],
        doc['entered'],
        doc['left']
      );
      return users;
    });
  }
  @override
  void initState() {
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text("No internet connection"));
        }
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Activity.loading();
        }
        return ProfileView(users: getUser() as Users);
      } 
    );
  }
}