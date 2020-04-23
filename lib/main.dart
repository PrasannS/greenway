
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenway/views/login_screen.dart';
import 'views/resource_Page.dart';
import 'package:greenway/views/onboarding_screen.dart';


Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: OnboardingScreen()
    ),
  );
}


