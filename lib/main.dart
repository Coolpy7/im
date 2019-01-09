import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im/login_page.dart';
import 'home/home_screen.dart';
import 'constants.dart' show AppColors;

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomeScreen.tag: (context) => HomeScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.AppBarColor),
          cardColor: Color(AppColors.AppBarColor)
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}
