import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_database/home_page.dart';
import 'package:movie_database/movie_list.dart';
import 'package:movie_database/profile.dart';
import 'package:movie_database/search.dart';
import 'package:movie_database/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

enum _MenuValues {
  settings,
  logout,
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: const Color(0xFF212121),
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int index = 0;
  final screens = [
    const homePage(),
    const search(),
    const profile(),
  ];


  /// Varsayılan bir style yapısı oluşturuyoruz istediğimiz yerde ismiyle çağırıyoruz
  static const TextStyle optionStyle = TextStyle(
      fontSize: 60,
      //fontWeight: FontWeight.bold,
      fontFamily: "OoohBaby",
      color: Colors.white70);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.yellow, Colors.yellow],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
        ),
        actions: <Widget>[
          PopupMenuButton<_MenuValues>(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            color: const Color(0xFF212121),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                  value: _MenuValues.settings,
                  child: ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0.0, 0.0),
                      child: const Text("Settings",
                          style: TextStyle(color: Colors.white)),
                    ),
                  )),
              PopupMenuItem(
                  value: _MenuValues.logout,
                  child: ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: Transform(
                      transform: Matrix4.translationValues(-16, 0.0, 0.0),
                      child: const Text("Log Out",
                          style: TextStyle(color: Colors.white)),
                    ),
                  )),
            ],
            onSelected: (value) {
              switch (value) {
                case _MenuValues.settings:
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => settings(),
                  ));
                  break;
                case _MenuValues.logout:
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => settings(),
                  ));
                  break;
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.black87,
              ),
            ),
          ),
        ],
        title: const Text(
          'IMDb',
          style: TextStyle(
              fontFamily: 'ComicNeue',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
      ),
      body: Center(
        child: screens[index],

      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.yellow,
          labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.white70,
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
        ),
      ),
    );
  }
}
