import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';
import 'package:camera/camera.dart';


Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(96, 158, 158, 158)
      ),
      title: "camara App",
      home: Homepage(),
    );
  }
}