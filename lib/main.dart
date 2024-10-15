//Assignment 1

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'DatePicker Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(fontSize: 18, color: Colors.purple[800]),
//           labelLarge: TextStyle(fontSize: 16), // ใช้ labelLarge แทน button
//         ),
//       ),
//       home: DatePickerDemo(),
//     );
//   }
// }

// class DatePickerDemo extends StatefulWidget {
//   @override
//   _DatePickerDemoState createState() => _DatePickerDemoState();
// }

// class _DatePickerDemoState extends State<DatePickerDemo> {
//   DateTime _startDate = DateTime(2024, 10, 8);
//   DateTime _endDate = DateTime(2024, 10, 8);

//   Future<void> _selectDate(BuildContext context, bool isStartDate) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: isStartDate ? _startDate : _endDate,
//       firstDate: isStartDate ? DateTime(2024) : _startDate,
//       lastDate: DateTime(2025),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStartDate) {
//           _startDate = picked;
//           if (_endDate.isBefore(_startDate)) {
//             _endDate = _startDate;
//           }
//         } else {
//           _endDate = picked;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple[600],
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('DatePicker Demo', style: TextStyle(color: Colors.white)),
//             Icon(Icons.calendar_today, color: Colors.white)
//           ],
//         ),
//         elevation: 4,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                   backgroundColor: Colors.purple[400],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () => _selectDate(context, true),
//                 icon: Icon(Icons.date_range, color: Colors.white),
//                 label: Text(
//                   'From: ${DateFormat('M/d/yyyy').format(_startDate)}',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                   backgroundColor: Colors.purple[300],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () => _selectDate(context, false),
//                 icon: Icon(Icons.date_range_outlined, color: Colors.white),
//                 label: Text(
//                   'To: ${DateFormat('M/d/yyyy').format(_endDate)}',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//---------------------------------------------------------------------------------------------//

//Assignment 2

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Coffee Ordering App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         scaffoldBackgroundColor: Colors.purple[100],
//       ),
//       home: CoffeeOrderingPage(),
//     );
//   }
// }

// class CoffeeOrderingPage extends StatefulWidget {
//   @override
//   _CoffeeOrderingPageState createState() => _CoffeeOrderingPageState();
// }

// class _CoffeeOrderingPageState extends State<CoffeeOrderingPage> {
//   bool isHotCoffee = true;
//   double sugarLevel = 1; // 0: None, 1: Less, 2: Normal

//   void _toggleCoffeeType(bool value) {
//     setState(() {
//       isHotCoffee = value;
//     });
//   }

//   String _getSugarLevelText() {
//     if (sugarLevel == 0) return 'None';
//     if (sugarLevel == 1) return 'Less';
//     return 'Normal';
//   }

//   void _showOrderConfirmation() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Your order'),
//           content: Text('${isHotCoffee ? 'Hot' : 'Iced'} coffee with ${_getSugarLevelText()} sugar'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MFU Coffee Shop', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.purple[800],
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.purple[800]!, Colors.purple[200]!],
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 'Your order',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//               SizedBox(height: 20),
//               Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text('Type:', style: TextStyle(fontSize: 18)),
//                           Switch(
//                             value: isHotCoffee,
//                             onChanged: _toggleCoffeeType,
//                             activeTrackColor: Colors.purple[200],
//                             activeColor: Colors.purple,
//                           ),
//                         ],
//                       ),
//                       Text(
//                         isHotCoffee ? 'Hot' : 'Iced',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 20),
//                       Text('Sugar level:', style: TextStyle(fontSize: 18)),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Slider(
//                               value: sugarLevel,
//                               min: 0,
//                               max: 2,
//                               divisions: 2,
//                               onChanged: (value) {
//                                 setState(() {
//                                   sugarLevel = value;
//                                 });
//                               },
//                               activeColor: Colors.purple,
//                               inactiveColor: Colors.purple[100],
//                             ),
//                           ),
//                           Text(_getSugarLevelText(), style: TextStyle(fontSize: 18)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(child: SizedBox()),
//               Center(
//                 child: ElevatedButton(
//                   child: Text('ORDER'),
//                   onPressed: _showOrderConfirmation,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple[800],
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                     textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//---------------------------------------------------------------------------------------------//
//Assignment 3

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MFU Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Color(0xFFFCE4EC), // Light pink background
      ),
      home: CoffeeOrderingPage(),
    );
  }
}

class Coffee {
  final String name;
  final double price;
  final String image; // เพิ่มฟิลด์ภาพ

  Coffee({required this.name, required this.price, required this.image}); // เพิ่มพารามิเตอร์ภาพ
}

class CoffeeOrderingPage extends StatefulWidget {
  @override
  _CoffeeOrderingPageState createState() => _CoffeeOrderingPageState();
}

class _CoffeeOrderingPageState extends State<CoffeeOrderingPage> {
  bool isHotCoffee = true;
  double sugarLevel = 1; // 0: None, 0.5: Less, 1: Normal
  int selectedCoffeeIndex = 0;

  List<Coffee> coffees = [
    Coffee(name: 'Latte', price: 35, image: 'assets/late.jpg'), // เพิ่มภาพ
    Coffee(name: 'Americano', price: 30, image: 'assets/ameca.jpg'), // เพิ่มภาพ
    Coffee(name: 'Cappuccino', price: 40, image: 'assets/capu.jpg'), // เพิ่มภาพ
  ];

  void _toggleCoffeeType(bool value) {
    setState(() {
      isHotCoffee = value;
    });
  }

  String _getSugarLevelText() {
    if (sugarLevel == 0) return 'None';
    if (sugarLevel == 0.5) return 'Less';
    return 'Normal';
  }

  void _showOrderConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${coffees[selectedCoffeeIndex].name}'),
              Image.asset(coffees[selectedCoffeeIndex].image), // แสดงภาพเมนู
              Text('Temperature: ${isHotCoffee ? 'Hot' : 'Cold (+5)'}'),
              Text('Sugar: ${_getSugarLevelText()}'),
              Text('Total: ฿${_calculateTotal().toStringAsFixed(0)}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Thank you for your order!')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  double _calculateTotal() {
    double total = coffees[selectedCoffeeIndex].price;
    if (!isHotCoffee) total += 5;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MFU Coffee Shop', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Your order',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text('Coffee', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              children: coffees.map((coffee) => 
                RadioListTile<int>(
                  title: Text('${coffee.name} ${coffee.price.toStringAsFixed(0)}'),
                  value: coffees.indexOf(coffee),
                  groupValue: selectedCoffeeIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedCoffeeIndex = value!;
                    });
                  },
                  activeColor: Colors.purple,
                )
              ).toList(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text('Hot'),
                    Switch(
                      value: !isHotCoffee,
                      onChanged: (value) => _toggleCoffeeType(!value),
                      activeTrackColor: Colors.purple[200],
                      activeColor: Colors.purple,
                    ),
                    Text('Cold (+5)'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Sugar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text('None'),
                Expanded(
                  child: Slider(
                    value: sugarLevel,
                    min: 0,
                    max: 1,
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
                Text('Normal'),
              ],
            ),
            Expanded(child: SizedBox()),
            Center(
              child: ElevatedButton(
                child: Text('ORDER'),
                onPressed: _showOrderConfirmation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
    );
  }
}
