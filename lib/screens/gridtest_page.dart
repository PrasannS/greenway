import 'package:flutter/material.dart';

class ExampleGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Grid Demo'),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: new List<Widget>.generate(16, (index) {
          return new GridTile(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4.5),
              child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(0, 0.1),
                      blurRadius: 3.0,
                    ),
                  ], color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Item Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
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
                    Row(children: <Widget>[
                      Text(
                        '   \$ 49.99',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '   Eco-Friendly',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Text('   Item Description'),
                    ]),
                  ],
                )),
              )
          );
        }),
      ),
    );
  }
}
