part of 'widgets.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key, required this.orders, required this.templates, required this.pendings}) : super(key: key);
  final Orders orders;
  final Pendings pendings;
  final Templates templates;
  @override
  State<HistoryView> createState() => _HistoryViewState();
}
class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    final Orders orders = widget.orders;
    final Pendings pendings = widget.pendings;
    final Templates templates = widget.templates;
    final Brightness brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateOrder(orders: orders)
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                Hero(
                  tag: templates.photo,
                  child: FadeInImage(
                    height: 100,
                    width: 100,
                    placeholder: const AssetImage('assets/images/no_net_bg.png'),
                    image: NetworkImage(templates.photo)
                  )
                ),
                const SizedBox(height: 30),
                Text(
                  templates.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: brightness == Brightness.dark ? Colors.white : Colors.black
                  )
                ),
                const SizedBox(height: 20),
                Text(
                  pendings.status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: brightness == Brightness.dark ? Colors.white : Colors.black
                  )
                )
              ]
            )
          ),
          highlightColor: Colors.blue,
          borderRadius: BorderRadius.circular(10)
        ),
        color: brightness == Brightness.dark ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))
      )
    );
  }
}