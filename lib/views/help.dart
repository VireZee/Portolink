part of 'views.dart';

class Help extends StatefulWidget {
  const Help({ Key? key }) : super(key: key);
  @override
  _HelpState createState() => _HelpState();
}
class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF00FF00),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}