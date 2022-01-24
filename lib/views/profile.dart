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
    return Container(
      alignment: Alignment.center,
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: uCollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("No internet connection"));
            } 
            else if (snapshot.connectionState == ConnectionState.waiting) {
              return Activity.loading();
            }
            return Stack(
              children: snapshot.data!.docs.map((DocumentSnapshot d) {
                final Users users = Users (
                  d['uid'],
                  d['photo'],
                  d['name'],
                  d['phone'],
                  d['email'],
                  d['password'],
                  d['message'], 
                  d['created'],
                  d['updated'],
                  d['entered'],
                  d['left']
                );
                if (d['uid'] == FirebaseAuth.instance.currentUser!.uid) {
                  users;
                }
                return ProfileView(users: users);
              }).toList()
            );
          }
        )
      )
    );
  }
}