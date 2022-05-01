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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Color',
                            style: TextStyle(fontSize: 15)
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            onChanged: (value) => isEmpty(),
                            controller: ctrlColor,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                            ),
                            maxLines: 1,
                            textInputAction: TextInputAction.next
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Contact',
                            style: TextStyle(fontSize: 15)
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            onChanged: (value) => isEmpty(),
                            controller: ctrlContact,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                            ),
                            maxLines: 2,
                            textInputAction: TextInputAction.done
                          ),
                          const SizedBox(height: 80),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: 250,
                              child: ElevatedButton.icon(
                                onPressed: isEmpty()
                                ? () async {
                                  setState(() => load = true);
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  final ConnectivityResult net = await (Connectivity().checkConnectivity());
                                  final bool sub = await InternetConnectionChecker().hasConnection;
                                  if (net == ConnectivityResult.none) {
                                    setState(() => load = false);
                                    ft.showToast(
                                      child: Activity.showToast(
                                        'No internet connection',
                                        const Color(0xFFFF0000)
                                      ),
                                      toastDuration: const Duration(seconds: 1),
                                      fadeDuration: 200
                                    );
                                  }
                                  else if (ctrlColor.text.isEmpty) {
                                    setState(() => load = false);
                                    ft.showToast(
                                      child: Activity.showToast(
                                        'Color can\'t be empty',
                                        const Color(0xFFFF0000)
                                      ),
                                      toastDuration: const Duration(seconds: 1),
                                      fadeDuration: 200
                                    );
                                  }
                                  else if (ctrlContact.text.isEmpty) {
                                    setState(() => load = false);
                                    ft.showToast(
                                      child: Activity.showToast(
                                        'Contact can\'t be empty',
                                        const Color(0xFFFF0000)
                                      ),
                                      toastDuration: const Duration(seconds: 1),
                                      fadeDuration: 200
                                    );
                                  }
                                  else if (sub) {
                                    if (_formKey.currentState!.validate()) {
                                      final Orders orders = Orders(
                                        widget.name,
                                        ctrlColor.text,
                                        '',
                                        '',
                                        ctrlContact.text
                                      );
                                      const Pendings pendings = Pendings(
                                        'Sent, Waiting for approval',
                                        ''
                                      );
                                      await OrdersAuth.addOrder(orders, pendings).then((value) {
                                        if (value == true) {
                                          setState(() => load = false);
                                          ft.showToast(
                                            child: Activity.showToast(
                                              'Sent',
                                              Colors.blue
                                            ),
                                            toastDuration: const Duration(seconds: 1),
                                            fadeDuration: 200
                                          );
                                          clearForm();
                                        }
                                      });
                                    }
                                    Navigator.pushNamedAndRemoveUntil(context, '/main', (Route<dynamic> route) => false);
                                  }
                                  else {
                                    setState(() => load = false);
                                    ft.showToast(
                                      child: Activity.showToast(
                                        'No internet connection',
                                        const Color(0xFFFF0000)
                                      ),
                                      toastDuration: const Duration(seconds: 1),
                                      fadeDuration: 200
                                    );
                                  }
                                }
                                : null,
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.resolveWith((states) {
                                    return states.contains(MaterialState.pressed)
                                    ? Colors.blue
                                    : null;
                                  }),
                                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                                    return states.contains(MaterialState.pressed)
                                    ? const Color(0xFF00FF00)
                                    : null;
                                  }),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                                  )
                                ),
                                icon: const Icon(Icons.shopping_bag),
                                label: Row(
                                  children: const [
                                    Spacer(),
                                    Text(
                                      'Order Template',
                                      style: TextStyle(fontSize: 20)
                                    ),
                                    Spacer()
                                  ]
                                )
                              )
                            )
                          )
                        ]
                      )
                    )
                  ]
                )
              ]
            )
          )
        ),
        load == true
        ? Activity.sent()
        : Container()
      ]
    );
  }
}