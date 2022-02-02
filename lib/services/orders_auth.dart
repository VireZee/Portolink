part of 'services.dart';

class OrdersAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference oCollection = FirebaseFirestore.instance.collection('Orders');
  static CollectionReference pCollection = oCollection.doc().collection('Pending Status');
  static DocumentReference? oDocument;
  static DocumentReference? pDocument;
  static Reference? ref;
  static UploadTask? uploadTask;
  static String? imgUrl;
  static Future<bool> addOrder(Orders orders, Pendings pendings, PickedFile imgFile) async {
    await Firebase.initializeApp();
    final String dateNow = Activity.dateNow();
    await oCollection.doc(oDocument!.id).set({
      'OID': oDocument!.id,
      'Name': orders.name,
      'Color': orders.color,
      'Description': orders.desc,
      'Photo Reference': orders.photo,
      'Contact': orders.contact,
      'Added By': auth.currentUser!.uid,
      'Created': dateNow
    });
    await pCollection.doc(pDocument!.id).set({
      'Status': 'In Progress',
      'Text': pendings.text
    });
    ref = FirebaseStorage.instance.ref().child('Design Request Photos').child(oDocument!.id + 'jpg');
    uploadTask = ref!.putFile(File(imgFile.path));
    await uploadTask!.whenComplete(() => ref!.getDownloadURL().then((value) => imgUrl = value));
    oCollection.doc(oDocument!.id).update({
      'Photo Reference': imgUrl
    });
    return true;
  }
  static Future<bool> deleteOrder(Orders orders) async {
    await Firebase.initializeApp();
    await oCollection.doc(oDocument!.id).delete();
    return true;
  }
}