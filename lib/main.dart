import 'package:agneya/allview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agneya',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          background: const Color(0xFF1C1B20),
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const AllView(),
    );
  }
}
