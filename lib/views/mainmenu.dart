part of 'views.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);
  static const String routeName = '/main';
  @override
  _MainMenuState createState() => _MainMenuState();
}
class _MainMenuState extends State<MainMenu> {
  bool load = false;
  static int _selectedIntex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Profile()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIntex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIntex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
        ],
        currentIndex: _selectedIntex,
        onTap: _onItemTapped
      )
    );
  }
}