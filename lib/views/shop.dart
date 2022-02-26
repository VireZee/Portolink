part of 'views.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);
  @override
  _ShopState createState() => _ShopState();
}
class _ShopState extends State<Shop> {
  String trigger = '';
  Stream<QuerySnapshot> sort() {
    Stream<QuerySnapshot> s = TemplatesAuth.tCollection.orderBy('Name').snapshots();
    setState(() {
      if (trigger == 'nd') {
        s = TemplatesAuth.tCollection.orderBy('Name').snapshots();
      }
      else if (trigger == 'nu') {
        s = TemplatesAuth.tCollection.orderBy('Name', descending: true).snapshots();
      }
      else if (trigger == 'pd') {
        s = TemplatesAuth.tCollection.orderBy('Price').snapshots();
      }
      else if (trigger == 'pu') {
        s = TemplatesAuth.tCollection.orderBy('Price', descending: true).snapshots();
      }
    });
    return s;
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
