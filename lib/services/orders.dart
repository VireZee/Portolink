part of 'services.dart';

class Orders {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference oCollection = FirebaseFirestore.instance.collection('Orders');
  static CollectionReference pCollection = FirebaseFirestore.instance.collection('Pendings');
  static DocumentReference oDocument;
  static DocumentReference pDocument;
  static Reference ref;
  static UploadTask uploadTask;
}