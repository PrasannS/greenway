

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenway/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body:ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 180),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 42,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '  Take a photo to make an entry',
                    style: (TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
                  ),
                  SizedBox(height: 25,),
                  IconButton(
                    icon: Icon(
                      Icons.camera,
                      size: 56,
                      color: Colors.green,
                    ),
                    padding: EdgeInsets.all(0),
                  ),
                  SizedBox(height: 180,),
                  Container(
                    height: 216,
                    width: 392,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 2
                            )
                        ),
                        color: Colors.green[200]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          'Total CO2 emitted',
                          style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontSize: 20
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "put emissions here",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Total entries',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "put entries here",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),



                ],
              ),

            ],
          ),
        ],
      )
    );
  }
}
