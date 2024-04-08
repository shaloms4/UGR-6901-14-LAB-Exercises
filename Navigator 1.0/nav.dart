import 'package:flutter/material.dart';



class NavApp extends StatelessWidget {
  const NavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Go to screen two'),
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> SecondScreen()),);
              },),
          ]
        ),
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(children: [
          ElevatedButton(child: Text('Return to screen one'),
          onPressed: (){
            Navigator.pop(context);
          },),
        ],)
      )
    );
  }
}