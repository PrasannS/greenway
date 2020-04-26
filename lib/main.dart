
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenway/screens/entries_page.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  //fetchFootprintResult('shoe');

  // Obtain a list of the available cameras on the device.

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: EntriesPage()
    ),
  );
}


