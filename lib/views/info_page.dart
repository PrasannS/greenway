import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:greenway/models/entry.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'details.dart';


import 'dart:async';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

import '../vision_utils/detector_painters.dart';
import 'package:path/path.dart' as Path;

class InfoPage extends StatefulWidget {
  final int index;
  final File image;


  InfoPage({Key key, this.index, this.image}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>{
  PageController _pageController;
  double _progress = 0;
  double _multiple;
  double _opacity;
  double _opacityTitleAppBar;
  Entry curentry;

  bool fbloaded = false;
  bool preloaded = false;

  Future getCurPost() async{
    await Firestore.instance.collection('posts').getDocuments().then((snapshot){
      int i = 0;
      for (DocumentSnapshot ds in snapshot.documents){
        if(i==widget.index){
          setState(() {
            curentry = Entry.fromMap(ds.data);
            name = curentry.title;
            fbloaded = true;
          });
        }
        i++;
      }
    });

    setState(() {
      fbloaded=true;
    });
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController
    if(widget.index==null)
      _getAndScanImagestart();
    else{
      preloaded = true;
      getCurPost();
    }

  }

  File _imageFile;
  Size _imageSize;
  dynamic _scanResults;
  Detector _currentDetector = Detector.label;
  final ImageLabeler _imageLabeler = FirebaseVision.instance.imageLabeler();
  String footprint = "Loading";
  String name = "Loading";
  String description = "Loading";

  Future<void> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    final Image image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    setState(() {
      _imageSize = imageSize;
    });
  }

  Future<void> _getAndScanImagestart() async {
    await uploadImage();
    setState(() {
      _imageFile = null;
      _imageSize = null;
    });

    final File imageFile = widget.image;

    if (imageFile != null) {
      _getImageSize(imageFile);
      _scanImage(imageFile);
    }

    setState(() {
      _imageFile = imageFile;
    });
    _submit();
  }

  Future<void> _getAndScanImage() async {
    setState(() {
      _imageFile = null;
      _imageSize = null;
    });

    final File imageFile =
    await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      _getImageSize(imageFile);
      _scanImage(imageFile);
    }

    setState(() {
      _imageFile = imageFile;
    });
  }

  Future<void> _scanImage(File imageFile) async {
    setState(() {
      _scanResults = null;
    });

    final FirebaseVisionImage visionImage =
    FirebaseVisionImage.fromFile(imageFile);

    dynamic results;
    switch (_currentDetector) {
      case Detector.label:
        results = await _imageLabeler.processImage(visionImage);
        break;
      default:
        return;
    }

    setState(() {
      _scanResults = results;

    });

    ImageLabel label = _scanResults[0];

    setState(() {
      name = label.text;
      fbloaded = true;
    });


  }

  Future uploadImage() async {
    print(Path.basename(widget.image.path));
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child("photos/${Path.basename(widget.image.path)}");
    StorageUploadTask upload = reference.putFile(widget.image);
    await upload.onComplete;
    print('complete');
  }


  _submit() async {
    //print("Starting to submit");
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String pic_url = await FirebaseStorage.instance
        .ref()
        .child("photos/${Path.basename(widget.image.path)}")
        .getDownloadURL();

    DocumentReference ref = await Firestore.instance.collection('posts').add({
      'uid':user.uid,
      'id':null,
      'image': pic_url,
      'title': name,
      'datetime': DateTime.now().millisecondsSinceEpoch,
      'footprint': (70+(new Random().nextInt(30)))
    });
  }


  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    int carbonnum = 90;
    int itemnum = 01;
    String category = "Leather"; //may not need this
    //_progress = 0;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
              child: Stack(
                children: [
                  AppBar(centerTitle: true,
                    elevation:0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.12 - _progress * (MediaQuery.of(context).size.height * 0.060),
                    left: 20 + _progress * (MediaQuery.of(context).size.height * 0.060),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 38 -
                              _progress *
                                  (MediaQuery.of(context).size.height *
                                      0.011),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .16,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(80, 255, 255, 255)),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                              "#00" + itemnum.toString(),
                              style: TextStyle(
                                  fontFamily: 'Google',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 200,
              child:Padding(
                padding: const EdgeInsets.fromLTRB(0, 13, 13, 13),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: preloaded? Image.network(curentry.image,).image:Image.file(widget.image).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SlidingSheet(
              listener: (state) {
                setState(() {
                  _progress = state.progress;
                  _multiple = 1 - interval(0.6, 0.87, _progress);
                  _opacity = _multiple;
                  _opacityTitleAppBar = interval(0.6, 0.87, _progress);
                });
              },
              elevation: 0,
              cornerRadius: 40,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [0.1, .87, 1.00],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              builder: (context, state) {
                return Container(
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).size.height * .12,
                  child: fbloaded?Details(item: name,):Center(child: CircularProgressIndicator()),
                );
              },
              headerBuilder: (context, state){
                return Container(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Center(
                    child: Icon(Icons.swap_vert,color: Colors.black,
                      size: 30.0 ,),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }




}