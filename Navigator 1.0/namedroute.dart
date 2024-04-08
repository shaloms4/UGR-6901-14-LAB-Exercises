import 'package:flutter/material.dart';
import 'package:flutter_application_2/navigator/nav.dart';


class NamedRoute extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     initialRoute: '/',
     routes: {
       '/': (context) => FirstScreen(),
       '/second': (context) => SecondScreen()
     },
   );
 }
}
