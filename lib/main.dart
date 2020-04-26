
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenway/api_client/api_client.dart';
import 'package:greenway/screens/entries_page.dart';
import 'package:greenway/views/home_screen.dart';
import 'package:greenway/views/onboarding_screen.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  //fetchFootprintResult('shoe');

  // Obtain a list of the available cameras on the device.

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: OnboardingScreen()
    ),
  );
}


