part of 'services.dart';

// class Orders {
//   static FirebaseAuth auth = FirebaseAuth.instance;
//   static CollectionReference oCollection = FirebaseFirestore.instance.collection('Orders');
//   static CollectionReference pCollection = FirebaseFirestore.instance.collection('Pendings');
//   static DocumentReference oDocument;
//   static DocumentReference pDocument;
//   static Reference ref;
//   static UploadTask uploadTask;
//   final String imgUrl;
//   static Future<bool> addOrder(Orders orders, Pendings pendings, PickedFile imgFile) async {
//     await Firebase.initializeApp();
//     final String dateNow = Activity.dateNow();
//     pDocument = await pCollection.add({
//       'pid': pendings.pid,
//       'pname': pendings.pname,
//       'pcolor': pendings.pcolor,
//       'pdesc': pendings.pdesc,
//       'pstatus': pendings.pstatus,
//       'ptext': pendings.ptext,
//       'addBy': auth.currentUser!.uid
//     });
//   }
// }