import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:disenos/src/pages/basico_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:disenos/src/pages/botones_page.dart';
import 'package:disenos/src/pages/Prueba_fondo_pantalla.dart';
import 'package:disenos/src/pages/botones_page2.dart';
import 'package:disenos/src/pages/chat.dart';
import 'package:disenos/src/pages/login.dart';
import 'package:disenos/src/pages/settings.dart';
import 'package:disenos/src/pages/profile.dart';
import 'package:disenos/src/pages/food.dart';
import 'package:disenos/src/pages/sql_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'scroll',
      routes: {
        'basico'  : (BuildContext context ) => BasicoPage(),
        'scroll'  : (BuildContext context ) => ScrollPage(),
        'botones' : (BuildContext context ) => BotonesPage(),
        'botones2'  : (BuildContext context) => BotonesPage2(),
        'fondo'   : (BuildContext context) => AnimatedBottomBar(),
        'chat'   : (BuildContext context) => ChatTwoPage(),
        'login'   : (BuildContext context) => LoginFourPage(),
        'settings'   : (BuildContext context) => SettingsThreePage(),
        'profile'   : (BuildContext context) => ProfileSevenPage(),
        'food'   : (BuildContext context) => FoodDeliveryHomePage(),
        'bbdd'   : (BuildContext context) => HomePage(),

      },
    );
  }
}
//ChatTwoPage