part of 'views.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    final brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
    return ThemeSwitchingArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/help_bg.jpg'),
            fit: BoxFit.fill
          )
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 75,
            elevation: 0,
            actions: [
              ThemeSwitcher(
                builder: (context) => IconButton(
                  onPressed: () {
                    final brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
                    ThemeSwitcher.of(context).changeTheme(
                      theme: brightness == Brightness.dark
                      ? BlackWhite.lightTheme()
                      : BlackWhite.darkTheme(),
                      isReversed: brightness == Brightness.light ? true : false
                    );
                  },
                  icon: brightness == Brightness.dark ? const Icon(CupertinoIcons.sun_max_fill) : const Icon(CupertinoIcons.moon_stars_fill),
                  color: brightness == Brightness.dark ? Colors.white : Colors.black
                )
              )
            ]
          ),
          backgroundColor: Colors.transparent,
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              Text("Cara Pemesanan", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight:FontWeight.bold)),
              SizedBox(height: 12),
              Text("1. Pembeli memilih Template yang dipesan", textAlign: TextAlign.justify, style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text("2. Pembeli akan memasukkan data pembelian yang tersedia", textAlign: TextAlign.justify, style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text("3. Pembeli akan mengkonfirmasi pesanan dengan menekan tombol pesan", textAlign: TextAlign.justify, style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text("4. Seletah order terkirim, pembeli akan dihubungi lewat contact yang telah dicantumkan untuk proses lebih lanjutnya", textAlign: TextAlign.justify, style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text("5. Pembayaran akan digunakan melalui aplikasi e-wallet dan m-banking ini", textAlign: TextAlign.justify, style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text("BCA: example 3456781123", textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text("OVO: example 4442238097 ", textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text("6. Barang pesanan akan dikirim melalui apikasi melalui menu pending ", textAlign: TextAlign.justify, style: TextStyle(fontSize: 24))
            ]
          )
        )
      )
    );
  }
}