import 'package:finily/res/asset/call_assets.dart';
import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/string/feature.dart';
import 'package:finily/res/string/string.dart';
import 'package:finily/res/style/style.dart';
import 'package:finily/routes/auth_route.dart';
import 'package:finily/routes/hoem_route.dart';
import 'package:finily/ui/widgets/buttons/primary_button.dart';
import 'package:finily/ui/widgets/buttons/secondary_button.dart';
import 'package:finily/ui/widgets/clipper/wave_clipper.dart';
import 'package:finily/ui/widgets/text/tagline.dart';
import 'package:finily/ui/widgets/text/title.dart';
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
                  TitleWidget(
                    text: AppStrings.welcomeText,
                    color: AppColors.primaryColor,
                  ),
                  Tagline(
                    text: AppStrings.taglineWithBusinessGrowth,
                    color: AppColors.textDark,
                  ),
                  SizedBox(height: AppStyle.largeSpacing),
                  Image.asset(
                    CallAssets.login,
                    height: size.height * 0.35,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: AppStyle.largeSpacing),

                  ButtonPrimary(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeRoute.home,
                        (route) => false,
                      );
                    },
                    text: FeatureText.login,
                  ),
                  SizedBox(height: AppStyle.mediumSpacing),
                  ButtonSecondary(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AuthRoute.register);
                    },
                    text: FeatureText.register,
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
