import 'package:flutter/material.dart';

class ExampleGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        backgroundColor: Colors.white,
        body:new Container(
        child: new GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (2 / 3),
          children: new List<Widget>.generate(16, (index) {
            return new GridTile(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          offset: Offset(0, 0.1),
                          blurRadius: 3.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        width: double.infinity,
                        height: 80,
                        child: ClipRRect(
                          child: Image.network(
                            'https://cdn.discordapp.com/attachments/702571621176836186/702961809275224114/images.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0, 5),
                              blurRadius: 8.0,
                            ),
                          ],
                          // IMAGE GOES HERE
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),

                Text('One', textAlign: TextAlign.left,
                  style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(children: <Widget>[
                        Text(
                          ' ___________________________',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.8,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(children: <Widget>[
                        Text(
                          '    \$49.99',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                      Row(children: <Widget>[
                        Text(
                          '     Seller',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ],
                  )),
            ));
          }),
        ),
        )
      );
    }
  }

