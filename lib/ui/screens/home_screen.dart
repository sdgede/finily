import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/style/style.dart';
import 'package:finily/ui/widgets/clipper/wave_clipper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        leading: Icon(Icons.menu, color: AppColors.textLight),
        title: Text(
          "Finily",
          style: TextStyle(
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications, color: AppColors.textLight),
          SizedBox(width: 16),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.43,
              color: AppColors.primaryColor.withOpacity(0.23),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.4,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: AppStyle.largeSpacing),
          Container(
            width: size.width,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
              gradient: LinearGradient(
                colors: [
                  AppColors.backgroundColor,
                  AppColors.backgroundColor.withOpacity(0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
