import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:greenway/views/main_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  File _image;

  @override
  void initState() {
    super.initState();
    nameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });

    await uploadImage();
  }

  Future uploadImage() async {
    print(Path.basename(_image.path));
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child("photos/${Path.basename(_image.path)}");
    StorageUploadTask upload = reference.putFile(_image);
    await upload.onComplete;
    print('complete');
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String passwordValidator(String value) {
    if (value.length < 8) {
      return 'Password length must be longer than 8 characters';
    }
    else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: Container(
                    child: Text(
                      'Signup',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  ),
                ),

                Row(
                  children: <Widget>[
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        getImage();
                      },
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.grey[400],
                        child: Icon(Icons.add_a_photo, size: 40.0, color: Colors.white,),
                      ),
                    ),
                    Spacer()
                  ],
                ),

                Container(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(
                                color: Colors.black
                            ),
                            controller: nameInputController,
                            decoration: InputDecoration(
                                labelText: 'NAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            validator: (input) {
                              if (input.trim().length < 1) {
                                return "Please input a valid name";
                              }
                              else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.black
                            ),
                            controller: emailInputController,
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                // hintText: 'EMAIL',
                                // hintStyle: ,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            validator: emailValidator,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.black
                            ),
                            controller: passwordInputController,
                            decoration: InputDecoration(
                                labelText: 'PASSWORD ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            obscureText: true,
                            validator: passwordValidator,
                          ),
                          SizedBox(height: 50.0),
                          GestureDetector(
                              onTap: () {
                                  print("HELLO");
                                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailInputController.text, password: passwordInputController.text).then(
                                          (currentUser) async {
                                            String pic_url = await FirebaseStorage.instance
                                                .ref()
                                                .child("photos/${Path.basename(_image.path)}")
                                                .getDownloadURL();
                                        Firestore.instance.collection('users').document(currentUser.user.uid).setData({
                                          "name":nameInputController.text,
                                          "email":emailInputController.text,
                                          "uid":currentUser.user.uid,
                                          "url":pic_url
                                        });
                                      });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MainPage()),
                                  );
                              },
                              child: Container(
                                height: 50.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  child: Center(
                                    child: Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    )),
              ]),
        ));
  }
}
