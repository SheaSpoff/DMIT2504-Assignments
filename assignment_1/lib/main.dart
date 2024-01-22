// ignore_for_file: use_key_in_widget_constructors, todo

import 'package:flutter/material.dart';

//https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e

//This app makes use of the Row, Column,
//Expanded, Padding, Transform, Container,
//BoxDecoration, BoxShape, Colors,
//Border, Center, Align, Alignment,
//EdgeInsets, Text, and TextStyle Widgets
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //first level widget of Material Design
      home: Scaffold(
        //default route
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("App1 - UI Layout"),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //TODO: Put your code here to complete this app.

            // Column 1
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: const Center(
                    child: Text(
                      'Container 1',
                    ),
                  ),
                ),
               Transform.rotate(
                angle: 3.14 / 4,
                child :  Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Container 2',
                    ),
                  ),
                )
               ),
              ],
            ),
            // End of Column 1
            // Column 2
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.yellow,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Container 3",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.blue,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Container 4",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // End of Column 2
            // Column 3
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Center(
                      child: Text(
                        'Container 5',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Con 6",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            ),
            // End of Column 3
          ],
        ),
      ),
    );
  }
}