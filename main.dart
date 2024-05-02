import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _Age = 0;
  int _Weigth = 0;
  int _Heigth = 0;
  bool _isMaleSelected = true;

  void _incrementAge() {
    setState(() {
      _Age++;
    });
  }

  void _decrementAge() {
    setState(() {
      if (_Age > 0) {
        _Age--;
      }
    });
  }

  void _incrementWiegth() {
    setState(() {
      _Weigth++;
    });
  }

  void _decrementWiegth() {
    setState(() {
      if (_Weigth > 0) {
        _Weigth--;
      }
    });
  }

  void _incrementHeigth() {
    setState(() {
      _Heigth++;
    });
  }

  void _decrementHeigth() {
    setState(() {
      if (_Heigth > 0) {
        _Heigth--;
      }
    });
  }

  void _toggleGender() {
    setState(() {
      _isMaleSelected = !_isMaleSelected;
    });
  }

String _calculateBMI() {
  if (_Heigth == 0 || _Weigth == 0) {
    return '00';
  } else {
    // Calculate BMI
    double bmi = _Weigth / ((_Heigth / 100) * (_Heigth / 100));
    return bmi.toStringAsFixed(2);
  }
}

String _getBMICategory(double bmi) {
  if (bmi <= 18.4) {
    return 'Underweight';
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    return 'Normal';
  } else if (bmi >= 25 && bmi <= 39.9) {
    return 'Overweight';
  } else {
    return 'Obese';
  }
}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BMI APP',
                style: TextStyle(fontSize: 30,color: Colors.white),
              ),
        
        
        
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                     decoration: BoxDecoration( color: Colors.white,
                     borderRadius: BorderRadius.circular(10), ),
                    child: Column(
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$_Age',
                          style:
                              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: _incrementAge,
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: _decrementAge,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
        
                  SizedBox(width: 6,),
                  Container(
                     decoration: BoxDecoration( color: Colors.white,
                     borderRadius: BorderRadius.circular(10), ),
                    child: Column(
                      children: [
                        Text(
                          'Weight(KG)',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$_Weigth',
                          style:
                              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: _incrementWiegth,
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: _decrementWiegth,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
        
            
             SizedBox(height: 10,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 190,
                    height: 110,
                     decoration: BoxDecoration( color: Colors.white,
                     borderRadius: BorderRadius.circular(10), ),
                    child: Column(
                      children: [
                        Text('Height(cm)', style: TextStyle(fontSize: 18)),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                          Text(
                              '$_Heigth',
                              style:
                                  TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          
                              Column(
                                children: [ IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: _incrementHeigth,
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: _decrementHeigth,
                                ),],
                              )
                              ],  )
                      ],
                    ),
                  ),
                ],
              ),
        
                  
                SizedBox(height: 10,),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 190,
                         decoration: BoxDecoration( color: Colors.white,
                     borderRadius: BorderRadius.circular(10), ),
                        child: Column(
                          children: [
                            Text('Gender', style: TextStyle(fontSize: 18)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Iam a', style: TextStyle(fontSize: 40)),
                                Column(children: [
                                  
                                IconButton(
                                  icon: _isMaleSelected
                                      ? Icon(Icons.male)
                                      : Icon(Icons.female),
                                  color: _isMaleSelected ? Colors.black : Colors.pink,
                                  onPressed: _toggleGender,
                                ),
                                IconButton(
                                  icon: _isMaleSelected
                                      ? Icon(Icons.female)
                                      : Icon(Icons.male),
                                  color: _isMaleSelected ? Colors.pink : Colors.black,
                                  onPressed: _toggleGender,
                                )
                                ],)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
               
               SizedBox(height: 10,),
               
              Container(
                width: 190,
                 decoration: BoxDecoration( color: Colors.white,
                     borderRadius: BorderRadius.circular(10),),
                child: Column(children: [
                  Text('Your result is', style: TextStyle(fontSize: 20 )),
                  Text('${_calculateBMI()}',style: TextStyle(fontSize: 20),),
                  Text('${_getBMICategory(double.parse(_calculateBMI()))}',style: TextStyle(fontSize: 20),),                
                ],),
              ),
        
               SizedBox(height: 10,),

               ElevatedButton(
              onPressed: _calculateBMI,
              child: Text("Calculate",style: TextStyle(fontSize: 15,color: Colors.black )),
               )
        
        
            ],
          ),
        ),
      
    );
  }
}
