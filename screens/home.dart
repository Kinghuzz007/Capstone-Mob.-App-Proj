import 'dart:ui';
import 'package:flutter/services.dart';


import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String subject = '';
  String name = '';
  int? score;
  String grade = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 155, 77, 77),
        title: const Text('Result checker'),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: const [
                    Text(
                      'Hi, Returning student!!! 😇',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 13),
                Row(
                  children: const [
                    Text(
                      'Fill in your details to see your grade for each subjects',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Color(0xFFF5F5F5))),
                  color: Colors.white,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20),
                            TextField(
                               onChanged: (text) {
                                name = text;
                              }, 
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Name',
                                  hintText: 'Enter Your Name'),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TextField(
                               onChanged: (text) {
                                subject = text;
                              },  
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Subject',
                                  hintText: 'Enter Subject'),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                               onChanged: (value) {
                                 print(value);
                                score = int.parse(value) ;
                              
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Subject Score',
                                  hintText: 'Enter Subject Score'),
                            ),
                            SizedBox(height: 15),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: InkWell(
                    splashColor: Colors.black,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.brown,
                      child: Text('Submit'),
                      onPressed: () {
                        print(subject);
                        print(score);
                        print(name);
                        if(score! < 40){
                          grade = 'F';
                        } else if ( score! >= 40 &&  score! <= 49){
                          grade = 'D';
                        }
                        else if ( score! >= 50 &&  score! <= 59){
                          grade = 'C';
                        }
                         else if (score! >= 60 && score! <= 79) {
                          grade = 'B';
                        } else {
                           grade = 'A';
                        }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Result/Grade"),
                              // Retrieve the text which the user has entered by
                              // using the TextEditingController.
                              content: Text(
                                  'Output: Your grade for $subject is $grade'),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}