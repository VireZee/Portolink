part of 'services.dart';

// class Orders {
//   static FirebaseAuth auth = FirebaseAuth.instance;
//   static CollectionReference oCollection = FirebaseFirestore.instance.collection('Orders');
//   static CollectionReference pCollection = FirebaseFirestore.instance.collection('Pendings');
//   static DocumentReference oDocument;
//   static DocumentReference pDocument;
//   static Reference ref;
//   static UploadTask uploadTask;
//   static String imgUrl;
//   static Future<bool> add(Orders orders, Pendings pendings, PickedFile imgFile) async {
//     await Firebase.initializeApp();
//     final String dateNow = Activity.dateNow();
//     pDocument = await pCollection.add({
//       'PID': pDocument.id,
//       'Name': pendings.pname,
//       'Color': pendings.pcolor,
//       'Description': pendings.pdesc,
//       'Status': 'In Progress',
//       'Text': pendings.ptext,
//       'Added By': auth.currentUser!.uid
//     });
//     oDocument = await oCollection.add({
//       'OID': oDocument.id,
//       'Name': orders.oname,
//       'Color': orders.ocolor,
//       'Contact': orders.ocontact,
//       'Description': orders.odesc,
//       'Photo Reference': orders.ophoto,
//       'Added By': auth.currentUser!.uid,
//       'Status': 'In Progress',
//       'Created': dateNow
//     });
//     ref = FirebaseStorage.instance.ref().child('Design Request Photos').child(oDocument.id + 'jpg');
//     uploadTask = ref.putFile(File(imgFile.path));
//     await uploadTask.whenComplete(() => ref.getDownloadURL().then((value) => imgUrl = value));
//     oCollection.doc(oDocument.id).update({
//       'OID': oDocument.id,
//       'Photo Reference': imgUrl
//     });
//     return true;
//   }
// }