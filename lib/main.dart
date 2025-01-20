import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/parking_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: FirebaseOptions
    (
      apiKey: "AIzaSyDt9CntxbxVCyuBvbpbmYk6DEWhHsiWTmo",
       appId: "1:622279477281:android:b3a693edf78bf388397b60",
        messagingSenderId: "622279477281",
         projectId: "esp-fire-ca2be")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERD App',
      
      home: const ParkingScreen(),
    );
  }
}
