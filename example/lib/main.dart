import 'package:flutter/material.dart';
import 'package:wave_progress_indicator/wave_progress_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Wave progress indicator"),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 1,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: WaveProgressIndicator(
                      value: 0.66,
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent,
                          Colors.blueAccent,
                          Colors.blue,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      waveHeight: 20.0,
                      speed: 2,
                      borderRadius: BorderRadius.circular(100),
                      child: Center(
                        child: Text(
                          'Progressing',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: WaveProgressIndicator(
                      value: 0.65,
                      gradientColors: [Colors.purple, Colors.purpleAccent],
                      waveHeight: 15.0,
                      speed: 3.5,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Text('Hello', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
