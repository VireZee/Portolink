part of 'views.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.templates}) : super(key: key);
  final Templates templates;
  @override
  _DetailsState createState() => _DetailsState();
}
class _DetailsState extends State<Details> {
  final CollectionReference tCollection = FirebaseFirestore.instance.collection('Templates');
  @override
  Widget build(BuildContext context) {
    final Templates templates = widget.templates;
    final Brightness brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
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
            const SizedBox(height: 20.0),
            Text(
              Activity.toIDR(templates.price.toString()),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Dancing Script',
                fontSize: 25,
                color: Colors.blue
              )
            ),
            const SizedBox(height: 20.0),
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
            Column()
          ]
        )
      )
    );
  }
}