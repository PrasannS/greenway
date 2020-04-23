import 'package:flutter/material.dart';

class VideosPage extends StatefulWidget{

  @override
  _VidState createState() => _VidState();

}

class _VidState extends State<VideosPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello World!",
      style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
    );
  }


}