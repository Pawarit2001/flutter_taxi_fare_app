// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class TaxiFareUi extends StatefulWidget {
  const TaxiFareUi({super.key});

  @override
  State<TaxiFareUi> createState() => _TaxiFareUiState();
}

class _TaxiFareUiState extends State<TaxiFareUi> {
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();

  double totalFare = 0.0;
  bool showError = false;

  void calculateFare() {
    String distStr = distanceController.text.trim();
    String minStr = minuteController.text.trim();

    if (distStr.isEmpty || minStr.isEmpty) {
      setState(() {
        showError = true;
        totalFare = 0.0;
      });
      return;
    }

    setState(() {
      showError = false;
    });

    double km = double.parse(distStr);
    double minutes = double.parse(minStr);
    double fare = 0.0;

    fare += minutes * 3.0;

    if (km > 0) {
      if (km <= 1) {
        fare += 35;
      } else if (km <= 10) {
        fare += 35 + ((km - 1) * 6.50);
      } else if (km <= 20) {
        fare += 35 + (9 * 6.50) + ((km - 10) * 7.00);
      } else if (km <= 40) {
        fare += 35 + (9 * 6.50) + (10 * 7.00) + ((km - 20) * 8.00);
      } else if (km <= 60) {
        fare += 35 + (9 * 6.50) + (10 * 7.00) + (20 * 8.00) + ((km - 40) * 8.50);
      } else if (km <= 80) {
        fare += 35 + (9 * 6.50) + (10 * 7.00) + (20 * 8.00) + (20 * 8.50) + ((km - 60) * 9.00);
      } else {
        fare += 35 + (9 * 6.50) + (10 * 7.00) + (20 * 8.00) + (20 * 8.50) + (20 * 9.00) + ((km - 80) * 10.50);
      }
    }

    setState(() {
      totalFare = fare;
    });
  }

  void clearData() {
    setState(() {
      distanceController.clear();
      minuteController.clear();
      totalFare = 0.0;
      showError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Taxi Fare',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                // รูปภาพแท็กซี่
                Image.asset(
                  'assets/images/car.png',
                  width: size.width * 0.35,
                ),
                SizedBox(height: size.height * 0.015),
                Text(
                  'คำนวณค่าโดยสารแท็กซี่',
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ระยะทาง (กิโลเมตร) 🛣️',
                    style: TextStyle(fontSize: size.width * 0.04, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: distanceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    hintText: 'กรอกระยะทางระยะทาง',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: size.height * 0.015),

                // ช่องกรอกเวลาติด
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลารถติด (นาที) ⏱️',
                    style: TextStyle(fontSize: size.width * 0.04, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: minuteController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    hintText: 'กรอกเวลารถติดเวลาคติด',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                ElevatedButton(
                  onPressed: calculateFare,
                  child: Text(
                    'คำนวณค่าโดยสาร',
                    style: TextStyle(fontSize: size.width * 0.045, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    fixedSize: Size(size.width, size.height * 0.065),
                  ),
                ),
                SizedBox(height: size.height * 0.01),

                // ปุ่มยกเลิก
                ElevatedButton(
                  onPressed: clearData,
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(fontSize: size.width * 0.045, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(size.width, size.height * 0.065),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    border: Border.all(color: Colors.amber, width: 1.5),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'ค่าโดยสารแท็กซี่',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        totalFare.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: size.width * 0.1,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const Text('บาท'),
                    ],
                  ),
                ),

                if (showError) ...[
                  const SizedBox(height: 10),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    color: Colors.red,
                    child: const Row(
                      children: [
                        Icon(Icons.warning, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'กรุณากรอกข้อมูลให้ครบถ้วน',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}