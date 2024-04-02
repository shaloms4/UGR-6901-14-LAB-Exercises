import 'package:flutter/material.dart';

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center( 
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(color: Colors.white), 
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        backgroundColor: Colors.blue, 
        body: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildGenderContainer(Icons.male, 'Male'),
                    _buildGenderContainer(Icons.female, 'Female'),
                  ],
                ),
              ),
              SizedBox(height: 20), 
              _buildHeightBox(),
              SizedBox(height: 20), 
              _buildWeightAndAgeRow(),
              SizedBox(height: 20), 
              Center( 
                child: _buildCalculateButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderContainer(IconData icon, String text) {
    return Container(
      width: 120,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildHeightBox() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HEIGHT',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            '176cm',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 5),
          Slider(
            min: 100,
            max: 250,
            value: 176, 
            onChanged: (value) {
              
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeightAndAgeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildWeightBox(),
        _buildAgeBox(),
      ],
    );
  }

  Widget _buildWeightBox() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WEIGHT',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            '60',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.remove,
                color: Colors.white,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAgeBox() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'AGE',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            '23',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.remove,
                color: Colors.white,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalculateButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple, 
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'CALCULATE',
          style: TextStyle(fontSize: 18, color: Colors.white), 
        ),
      ),
    );
  }
}
