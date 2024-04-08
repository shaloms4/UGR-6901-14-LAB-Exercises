import 'package:flutter/material.dart';
import 'package:flutter_application_2/navigator/nav.dart';

class PassingData extends StatelessWidget {
  const PassingData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenX(),
    );
  }
}
class ScreenX extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("Screen X"),
     ),
     body: Center(
       child: ElevatedButton(
           child: const Text("Next"),
           onPressed: () {
             Navigator.push(
                 context, 
MaterialPageRoute(
                     builder: (BuildContext context) => ScreenY(),
                     settings: const RouteSettings(arguments: "data from x")
   )
);
           }),
     ),
   );
 }
}

class ScreenY extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   final text = 
ModalRoute.of(context)!.settings.arguments as String;
   return Scaffold(
     appBar: AppBar(
       title: const Text("Screen Y"),
     ),
     body: Center(child: Text(text)),
   );
 }
}
