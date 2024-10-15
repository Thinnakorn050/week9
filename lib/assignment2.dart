import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[100],
      ),
      home: CoffeeOrderingPage(),
    );
  }
}

class CoffeeOrderingPage extends StatefulWidget {
  @override
  _CoffeeOrderingPageState createState() => _CoffeeOrderingPageState();
}

class _CoffeeOrderingPageState extends State<CoffeeOrderingPage> {
  bool isHotCoffee = true;
  double sugarLevel = 1; // 0: None, 1: Less, 2: Normal

  void _toggleCoffeeType(bool value) {
    setState(() {
      isHotCoffee = value;
    });
  }

  String _getSugarLevelText() {
    if (sugarLevel == 0) return 'None';
    if (sugarLevel == 1) return 'Less';
    return 'Normal';
  }

  void _showOrderConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your order'),
          content: Text('${isHotCoffee ? 'Hot' : 'Iced'} coffee with ${_getSugarLevelText()} sugar'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MFU Coffee Shop', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[800],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[800]!, Colors.purple[200]!],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Your order',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Type:', style: TextStyle(fontSize: 18)),
                          Switch(
                            value: isHotCoffee,
                            onChanged: _toggleCoffeeType,
                            activeTrackColor: Colors.purple[200],
                            activeColor: Colors.purple,
                          ),
                        ],
                      ),
                      Text(
                        isHotCoffee ? 'Hot' : 'Iced',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text('Sugar level:', style: TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          Expanded(
                            child: Slider(
                              value: sugarLevel,
                              min: 0,
                              max: 2,
                              divisions: 2,
                              onChanged: (value) {
                                setState(() {
                                  sugarLevel = value;
                                });
                              },
                              activeColor: Colors.purple,
                              inactiveColor: Colors.purple[100],
                            ),
                          ),
                          Text(_getSugarLevelText(), style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Center(
                child: ElevatedButton(
                  child: Text('ORDER'),
                  onPressed: _showOrderConfirmation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[800],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}