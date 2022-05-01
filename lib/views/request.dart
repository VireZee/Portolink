part of 'views.dart';

class Request extends StatefulWidget {
  const Request({Key? key, required this.tid, required this.name, required this.desc, required this.price, required this.photo}) : super(key: key);
  final String tid;
  final String name;
  final String desc;
  final String price;
  final String photo;
  @override
  State<Request> createState() => _RequestState();
}
class _RequestState extends State<Request> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController ctrlDesc = TextEditingController();
  final TextEditingController ctrlContact = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  XFile? imgFile;
  final FToast ft = FToast();
  bool load = false;
  bool btn = true;
  Future<dynamic> chooseFile() async {
    const ImageSource imgSrc = ImageSource.gallery;
    final XFile? selectedImage = await imagePicker.pickImage(
      source: imgSrc,
      imageQuality: 100
    );
    setState(() => imgFile = selectedImage);
  }
  bool isEmpty() {
    setState(() {
      if (ctrlDesc.text != '' && ctrlContact.text != '' && imgFile != null) {
        btn = true;
      }
      else {
        btn = false;
      }
    });
    return btn;
  }
  @override
  void initState() {
    super.initState();
    ft.init(context);
  }
  @override
  void dispose() {
    ctrlDesc.dispose();
    ctrlContact.dispose();
    super.dispose();
  }
  void clearForm() {
    ctrlDesc.clear();
    ctrlContact.clear();
    setState(() => imgFile = null);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}