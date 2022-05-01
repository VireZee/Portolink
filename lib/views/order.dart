part of 'views.dart';

class Order extends StatefulWidget {
  const Order({Key? key, required this.tid, required this.name, required this.desc, required this.price, required this.photo}) : super(key: key);
  final String tid;
  final String name;
  final String desc;
  final String price;
  final String photo;
  @override
  State<Order> createState() => _OrderState();
}
class _OrderState extends State<Order> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController ctrlColor = TextEditingController();
  final TextEditingController ctrlContact = TextEditingController();
  final FToast ft = FToast();
  bool load = false;
  bool btn = true;
  bool isEmpty() {
    setState(() {
      if (ctrlColor.text != '' && ctrlContact.text != '') {
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
    ctrlColor.dispose();
    ctrlContact.dispose();
    super.dispose();
  }
  void clearForm() {
    ctrlColor.clear();
    ctrlContact.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Container>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/order_bg.jpg'),
              fit: BoxFit.fill
            )
          ),
          child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              backgroundColor: Colors.transparent,
              toolbarHeight: 75,
              elevation: 0,
              title: const Text('Order Template'),
              centerTitle: true
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <ListView>[
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  physics: const BouncingScrollPhysics(),
                  children: <Form>[
                    Form(
                      key: _formKey,
                      child: Column(
                        
                      ),
                    )
                  ]
                )
              ],
            ),
          )
        )
      ]
    );
  }
}