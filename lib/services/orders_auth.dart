part of 'services.dart';

class OrdersAuth {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final CollectionReference oCollection = FirebaseFirestore.instance.collection('Orders');
  static DocumentReference? oDocument;
  static Reference? ref;
  static UploadTask? uploadTask;
  static String? imgUrl;
  static Future<bool> addOrder(Orders orders, Pendings pendings) async {
    await Firebase.initializeApp();
    final String dateNow = Activity.dateNow();
    oDocument = await oCollection.add({
      'OID': '-',
      'Name': orders.name,
      'Color': orders.color,
      'Contact': orders.contact,
      'Added By': auth.currentUser!.displayName,
      'UID': auth.currentUser!.uid,
      'Pending Status': {
        'Status': pendings.status,
        'Text': pendings.text
      },
      'Created': dateNow,
      'Updated': '-'
    });
    await oCollection.doc(oDocument!.id).update({
      'OID': oDocument!.id
    });
    return true;
  }
  static Future<bool> addRequest(Orders orders, Pendings pendings, XFile imgFile) async {
    await Firebase.initializeApp();
    final String dateNow = Activity.dateNow();
    oDocument = await oCollection.add({
      'OID': '-',
      'Name': orders.name,
      'Description': orders.desc,
      'Photo Reference': orders.photo,
      'Contact': orders.contact,
      'Added By': auth.currentUser!.displayName,
      'UID': auth.currentUser!.uid,
      'Pending Status': {
        'Status': pendings.status,
        'Text': pendings.text
      },
      'Created': dateNow,
      'Updated': '-'
    });
    ref = FirebaseStorage.instance.ref().child('Design Request Photos').child(oDocument!.id + '.jpg');
    uploadTask = ref!.putFile(File(imgFile.path));
    await uploadTask!.whenComplete(() => ref!.getDownloadURL().then((value) => imgUrl = value));
    await oCollection.doc(oDocument!.id).update({
      'OID': oDocument!.id,
      'Photo Reference': imgUrl
    });
    return true;
  }
  static Future<bool> updateOrder(Orders orders, Pendings pendings, XFile imgFile) async {
    await Firebase.initializeApp();
    final String dateNow = Activity.dateNow();
    await FirebaseStorage.instance.ref().child('Design Request Photos').child(oDocument!.id + '.jpg').delete();
    ref = FirebaseStorage.instance.ref().child('Design Request Photos').child(oDocument!.id + '.jpg');
    uploadTask = ref!.putFile(File(imgFile.path));
    await uploadTask!.whenComplete(() => ref!.getDownloadURL().then((value) => imgUrl = value));
    await oCollection.doc(oDocument!.id).update({
      'Name': orders.name,
      'Color': orders.color,
      'Description': orders.desc,
      'Photo Reference': imgUrl,
      'Contact': orders.contact,
      'Pending Status': {
        'Status': 'Sent, Waiting for approval',
        'Text': pendings.text
      },
      'Updated': dateNow
    });
    return true;
  }
  static Future<bool> deleteOrder(Orders orders) async {
    await Firebase.initializeApp();
    await oCollection.doc(oDocument!.id).delete();
    await FirebaseStorage.instance.ref().child('Template Photos').child(oDocument!.id + '.jpg').delete();
    return true;
  }
}