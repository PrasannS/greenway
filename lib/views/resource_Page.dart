import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {

  getItemCoulumn (int index, ) {
    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          'Test Text',
          style: TextStyle(
              fontSize: 20
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Test Text',
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                ' Resource',
                style: TextStyle(
                  fontSize: 56,
                  color: Colors.black,
                  fontStyle: FontStyle.italic
                ),
              ),
              Text(
                ' Page',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.grey[600],

                ),
              ),
              SizedBox(height: 100),
              Container(
                height: 194,
                width: 392,
                child: Expanded(
                  child: ExpansionTile(
                    title: Text(
                      'Title',
                      style: TextStyle(
                        color: Colors.black
                      )
                    ),
                    backgroundColor: Colors.grey,
                    leading: Icon(Icons.ac_unit),
                    initiallyExpanded: false,
                    children: [
                      //getItemCoulumn(i)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}



