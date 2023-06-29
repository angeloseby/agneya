import 'package:agneya/screens/root/root.dart';
import 'package:agneya/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late bool isFirstTime;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  isFirstTime = sharedPref.getBool('firstTime') ?? true;
  if (isFirstTime == true){
    sharedPref.setBool('firstTime', false);
    print(isFirstTime.toString()); //To remove on release
  }
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
      home:  isFirstTime?const WelcomePage():const RootPage(),
    );
  }
}
