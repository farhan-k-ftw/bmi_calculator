import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String result = "";

  void calculateBMI() {
    double height = (double.tryParse(heightController.text) ?? 0) / 100;
    double weight = double.tryParse(weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double bmi = weight / (height * height);
      setState(() {
        result = "BMI: ${bmi.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        result = "Please enter valid numbers";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Height (m)",
                      filled: true,
                      fillColor: Colors.red,
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Weight (kg)",
                      filled: true,
                      fillColor: Colors.yellow,
                      labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateBMI,
                  child: const Text("Calculate"),
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    result,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
