part of 'views.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.templates}) : super(key: key);
  final Templates templates;
  @override
  _DetailsState createState() => _DetailsState();
}
class _DetailsState extends State<Details> {
  final CollectionReference tCollection = OrdersAuth.tCollection;
  @override
  Widget build(BuildContext context) {
    final Templates templates = widget.templates;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/shop_bg.jpg'),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: Colors.transparent,
          toolbarHeight: 75,
          elevation: 0
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Text(
              templates.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Oswald',
                fontSize: 50,
                color: Colors.blue
              )
            ),
            const SizedBox(height: 15),
            Hero(
              tag: templates.photo,
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/no_net_bg.png'),
                image: NetworkImage(templates.photo)
              )
            ),
            const SizedBox(height: 20),
            Text(
              Activity.toIDR(templates.price.toString()),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Dancing Script',
                fontSize: 25,
                color: Colors.blue
              )
            ),
            const SizedBox(height: 20),
            Text(
              templates.desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Flamenco',
                fontSize: 25,
                color: Colors.blue
              )
            ),
            const SizedBox(height: 100),
            Column(
              children: <SizedBox>[
                SizedBox(
                  height: 60,
                  width: 300,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Order(
                          tid: templates.tid,
                          photo: templates.photo,
                          name: templates.name,
                          desc: templates.desc,
                          price: templates.price.toString()
                        )
                      )
                    ),
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
                    icon: const Icon(Icons.shopping_cart),
                    label: Row(
                      children: const [
                        Spacer(),
                        Text('Order Template', style: TextStyle(fontFamily: 'Prompt', fontSize: 25)),
                        Spacer(flex: 1)
                      ]
                    )
                  )
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 60,
                  width: 300,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Request(
                          tid: templates.tid,
                          photo: templates.photo,
                          name: templates.name,
                          desc: templates.desc,
                          price: templates.price.toString()
                        )
                      )
                    ),
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
                    icon: const Icon(Icons.dashboard_customize),
                    label: Row(
                      children: const [
                        Spacer(),
                        Text('Request Template', style: TextStyle(fontFamily: 'Prompt', fontSize: 25)),
                        Spacer(flex: 1)
                      ]
                    )
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}