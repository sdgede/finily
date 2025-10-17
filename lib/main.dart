import 'package:finily/res/constant/config.dart';
import 'package:finily/routes/auth_route.dart';
import 'package:finily/routes/general_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MyApp());
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
      theme: ThemeData(fontFamily: "Roboto"),
      onGenerateRoute: GeneralRoute().generateRoute,
      initialRoute: AuthRoute.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
