part of 'views.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  bool load = false;
  CollectionReference uCollection = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder<QuerySnapshot>(  
        stream: uCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Failed to load data!");
          }
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return Activity.loading();
          }
          return Stack(
            children: snapshot.data!.docs.map((DocumentSnapshot doc) {
              final Users users = Users (
                doc['uid'],
                doc['photo'],
                doc['name'],
                doc['phone'],
                doc['email'],
                doc['password'],
                doc['message'], 
                doc['created'],
                doc['updated'],
                doc['entered'],
                doc['left']
              );
              return ProfileView(users: users);
            }).toList(),
          );
        }
      )
    );
  }
}