part of 'views.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);
  static const String routeName = '/main';
  @override
  _MainMenuState createState() => _MainMenuState();
}
class _MainMenuState extends State<MainMenu> {
  bool load = false;
  int _selectedIntex = 0;
  @override
  Widget build(BuildContext context) {
    return Text('Hello');
  }
}
