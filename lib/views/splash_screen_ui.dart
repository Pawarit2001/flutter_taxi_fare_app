import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/taxi_fare_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TaxiFareUi(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // รูปภาพรถแท็กซี่
              Image.asset(
                'assets/images/car.png',
                width: size.width * 0.45,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              // ข้อความหัวข้อหลักภาษาอังกฤษ
              Text(
                'Taxi Fare Calculator',
                style: TextStyle(
                  color: Colors.lightBlue[300],
                  fontSize: size.width * 0.055,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'คำนวณค่าโดยสารแท็กซี่',
                style: TextStyle(
                  color: Colors.lightBlue[200],
                  fontSize: size.width * 0.038,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                width: size.width * 0.1,
                height: size.width * 0.1,
                child: const CircularProgressIndicator(
                  color: Colors.amber,
                  strokeWidth: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}