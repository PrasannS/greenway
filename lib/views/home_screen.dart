



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenway/models/entry.dart';

import 'package:greenway/views/info_page.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future getImage(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoPage(image:image)),
    );

  }

  int totalentries = 0;
  int totalco2 = 0;

  Future getInfo() async{
    await Firestore.instance.collection('posts').getDocuments().then((snapshot){
      for (DocumentSnapshot ds in snapshot.documents){
        setState(() {
          Entry e = Entry.fromMap(ds.data);
          totalco2+=e.footprint;
          totalentries+=1;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '  Take a photo to make an entry',
                    style: (TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                  ),
                  SizedBox(height: 25,),
                  IconButton(
                    onPressed: (){
                      print("PROCESS STARTED");
                      getImage(context);
                    },
                    icon: Icon(
                      Icons.camera,
                      size: 65,
                      color: Colors.lightGreenAccent[400],
                    ),
                    padding: EdgeInsets.all(0),
                  ),
                  SizedBox(height: 150,),
                  Container(
                    height: 216,
                    width: 392,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 2
                            )
                        ),
                        color: Colors.green,
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
                          totalco2.toString(),
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
                          totalentries.toString(),
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
