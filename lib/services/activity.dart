part of 'services.dart';

class Activity {
  static String dateNow() {
    final DateTime now = DateTime.now();
    final formatter = DateFormat('d MMMM y, KK:mm:ss.S a');
    final String date = formatter.format(now);
    return date;
  }
  static void showToast(String msg, Color myColor) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: myColor,
      textColor: Colors.white,
      fontSize: 14
    );
  }
  static Container check() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black54,
      child: Lottie.asset('assets/images/auth.json')
    );
  }
  static Container loading() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black54,
      child: Lottie.asset('assets/images/loading.json')
    );
  }
  static String toIDR(String price) {
    final priceFormat = NumberFormat.currency(locale: 'ID');
    return priceFormat.format(double.parse(price));
  }
}