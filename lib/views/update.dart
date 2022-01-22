part of 'views.dart';

class Update extends StatefulWidget {
  const Update({Key? key, required this.uid, required this.name, required this.phone, required this.email}) : super(key: key);
  final String uid;
  final String name;
  final String phone;
  final String email;
  @override
  _UpdateState createState() => _UpdateState();
}
class _UpdateState extends State<Update> {
  static bool load = false;
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlEmail = TextEditingController();
  @override
  void initState() {
    ctrlName.text =  widget.name;
    ctrlPhone.text = widget.phone;
    ctrlEmail.text = widget.email;
    super.initState();
  }
  @override
  void dispose() {
    ctrlName.dispose();
    ctrlPhone.dispose();
    ctrlEmail.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}