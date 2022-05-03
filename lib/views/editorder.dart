part of 'views.dart';

class EditOrder extends StatefulWidget {
  const EditOrder({Key? key, required this.name, required this.color, required this.desc, required this.photo, required this.contact}) : super(key: key);
  final String name;
  final String color;
  final String desc;
  final String photo;
  final String contact;
  @override
  State<EditOrder> createState() => _EditOrderState();
}
class _EditOrderState extends State<EditOrder> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}