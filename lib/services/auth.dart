part of 'services.dart';

class Auth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference uCollection = FirebaseFirestore.instance.collection('Users');
  static String convertToTitleCase(String text) {
    final List<String> words = text.split(' ');
    final cap = words.map((word) {
      final String first = word.trim().substring(0, 1).toUpperCase();
      final String remain = word.trim().substring(1).toLowerCase();
      return '$first$remain';
    });
    return cap.join(' ');
  }
  static Future<String> signUp(Users users) async {
    await Firebase.initializeApp();
    final String dateNow = Activity.dateNow();
    String msg = '';
    final String token;
    final String uid;
    try {
      UserCredential uCredential = await auth.createUserWithEmailAndPassword(email: users.email, password: users.password);
      uid = uCredential.user!.uid;
      token = (await FirebaseMessaging.instance.getToken())!;
      await uCollection.doc(uid).set({
        'uid': uid,
        'photo': '-',
        'name': convertToTitleCase(users.name),
        'phone': users.phone.replaceAll(' ', ''),
        'email': users.email.replaceAll(' ', '').toLowerCase(),
        'password': sha512.convert(utf8.encode(sha512.convert(utf8.encode(users.password)).toString())).toString(),
        'message': '-',
        'token': token,
        'created': dateNow,
        'updated': '-',
        'entered': '-',
        'left': '-'
      }).then((value) {
        msg = 'Signed';
      });
      auth.currentUser!.updatePhotoURL(users.photo);
      auth.currentUser!.updateDisplayName(convertToTitleCase(users.name));
      return msg;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        msg = 'Existed';
      }
      else if (e.code == 'invalid-email') {
        msg = 'Invalid Email';
      }
      else if (e.code == 'weak-password') {
        msg = 'Invalid Pass';
      }
      else if (e.code == 'operation-not-allowed') {
        msg = 'Disabled';
      }
    }
    return msg;
  }
  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();
    final String dateNow = Activity.dateNow();
    String msg = '';
    final String token;
    final String uid;
    try {
      UserCredential uCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      uid = uCredential.user!.uid;
      token = (await FirebaseMessaging.instance.getToken())!;
      await uCollection.doc(uid).update({
        'isOn': '1',
        'token': token,
        'entered': dateNow
      }).then((value) {
        msg = 'Signed';
      });
      return msg;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        msg = 'None';
      }
      else if (e.code == 'wrong-password') {
        msg = 'Hacker';
      }
      else if (e.code == 'invalid-email') {
        msg = 'Invalid Email';
      }
      else if (e.code == 'user-disabled') {
        msg = 'Disabled';
      }
    }
    return msg;
  }
  static Future<bool> updateAccount(Users users) async {
    await Firebase.initializeApp();
    final String dateNow = Activity.dateNow();
    final String uid = auth.currentUser!.uid;
    await uCollection.doc(uid).update({
      'name': convertToTitleCase(users.name),
      'email': users.email.replaceAll(' ', '').toLowerCase(),
      'phone': users.phone.replaceAll(' ', ''),
      'updated': dateNow
    });
    auth.currentUser!.updateDisplayName(convertToTitleCase(users.name));
    auth.currentUser!.updateEmail(users.email.replaceAll(' ', '').toLowerCase());
    return true;
  }
  static Future<bool> signOut() async {
    await Firebase.initializeApp();
    final String dateNow = Activity.dateNow();
    final String uid = auth.currentUser!.uid;
    await uCollection.doc(uid).update({
      'isOn': '0',
      'token': '-',
      'left': dateNow
    });
    return true;
  }
  static Future<bool> deleteAccount() async {
    await Firebase.initializeApp();
    uCollection.doc(auth.currentUser!.uid).delete();
    auth.currentUser!.delete();
    return true;
  }
}