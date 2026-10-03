import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/splash_screen_ui.dart'; // เรียกใช้งานหน้า Splash Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ซ่อนแถบ Debug มุมขวาบน
      title: 'Taxi Fare App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Prompt', // (ถ้ามีฟอนต์ไทย สามารถใส่เพิ่มได้ หรือจะเว้นไว้ก็ได้ครับ)
      ),
      // กำหนดให้หน้าแรกที่แอปเปิดขึ้นมาคือ SplashScreenUI
      home: const SplashScreenUI(),
    );
  }
}