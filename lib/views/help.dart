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
      child: Stack(
        children: [
          Container(
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
                          ? MyTheme.lightTheme()
                          : MyTheme.darkTheme(),
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
            )
          )
        ]
      )
    );
  }
}