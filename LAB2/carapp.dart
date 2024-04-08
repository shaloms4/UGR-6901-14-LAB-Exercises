import 'package:flutter/material.dart';



class car extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/car.jpg'),
                    SizedBox(height: 20.0),
                    Text(
                      '1975 Porsche 911 Carrera',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite),
                            SizedBox(width: 5.0),
                            Text('0'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.comment),
                            SizedBox(width: 5.0),
                            Text('0'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.share),
                            SizedBox(width: 5.0),
                            Text('Share'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Essential Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1 of 3 done',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(Icons.done),
                  Text(
                    'Year, Make, Model, VIN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.edit),
                ],
              ),
              SizedBox(height: 10.0),
              Divider(color: Colors.grey),
              ListTile(
                title: Text('Year: 1975'),
              ),
              ListTile(
                title: Text('Make: Porsche'),
              ),
              ListTile(
                title: Text('Model: 911 Carrera'),
              ),
              ListTile(
                title: Text('VIN: 9115400029'),
              ),
              Divider(color: Colors.grey),
              ListTile(
                leading: Icon(Icons.done),
                title: Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.edit),
              ),
              Divider(color: Colors.grey),
              ListTile(
                leading: Icon(Icons.done),
                title: Text(
                  'Photos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
