part of 'widgets.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key, required this.orders}) : super(key: key);
  final Orders orders;
  @override
  State<HistoryView> createState() => _HistoryViewState();
}
class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}