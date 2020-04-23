import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class EntriesPage extends StatefulWidget {
  @override
  _EntriesPageState createState() => _EntriesPageState();
}

class _EntriesPageState extends State<EntriesPage> {


  @override
  Widget build(BuildContext context) {
    var posts;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Your Entries',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shuffle),
                      iconSize: 25,
                      color: Colors.black54,
                      onPressed: () => print('Shuffle Feed'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 35,
                      child: IconButton(
                        icon: Icon(Icons.add_box),
                        iconSize: 25,
                        color: Colors.black54,
                        onPressed: () => print('Add Update'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 2000.0,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return getFeedTile(index);
              },
            ),
          ),
        ],
      ),

    );
  }
  

  List<String>predefUsers = ['Prasann','Aditya', 'Dylan', 'Michael',];

  Widget getFeedTile (int index){

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(0, 0.1),
                  blurRadius: 3.0,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(predefUsers[index]
                        ,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.more_horiz),
                        color: Colors.grey,
                        onPressed: () => print('More'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          'https://picsum.photos/250?image=9',
                          fit: BoxFit.cover,
                        ),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        // IMAGE GOES HERE
                      ),

                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.smoking_rooms), color: Colors.black,
                                      iconSize: 30,
                                      onPressed: () {
                                        print("LIKED!");
                                      }
                                  ),
                                  Text(
                                    '120KG CO2',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 10,),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              child: FlatButton.icon(
                                color: Colors.black26,
                                icon: Icon(Icons.add_circle, color: Colors.black,),
                                label: Text('More info!', style: TextStyle(
                                  color: Colors.black,
                                ),),
                                splashColor: Colors.black,
                                onPressed: () {

                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );


  }

}