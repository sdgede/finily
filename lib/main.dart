import 'package:finily/res/constant/config.dart';
import 'package:finily/routes/general_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      onGenerateRoute: GeneralRoute().generateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
