import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/style/style.dart';
import 'package:finily/ui/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.2,
              color: AppColors.primaryColor,
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.23,
              color: AppColors.primaryColor.withOpacity(0.23),
            ),
          ),

          // Content
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppStyle.largeSpacing),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: AppStyle.mediumSpacing * 4 + AppStyle.largeSpacing,
                  ),

                  Text(
                    'Welcome !',
                    style: TextStyle(
                      fontSize: AppStyle.h1 * 2,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontFamily: AppStyle.fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    'Simplify Your Accounting & Grow Your Business',
                    style: TextStyle(
                      fontSize: AppStyle.h4,
                      color: AppColors.textDark,
                      fontFamily: AppStyle.fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: AppStyle.largeSpacing),

                  Image.asset(
                    'assets/images/login.png',
                    height: size.height * 0.35,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: AppStyle.largeSpacing),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.textLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 60.0,
                      ),
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(height: AppStyle.mediumSpacing),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      backgroundColor: AppColors.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 50.0,
                      ),
                      child: Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
