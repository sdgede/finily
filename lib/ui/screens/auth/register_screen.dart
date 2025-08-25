import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/string/string.dart';
import 'package:finily/res/style/style.dart';
import 'package:finily/ui/widgets/buttons/primary_button.dart';
import 'package:finily/ui/widgets/buttons/secondary_button.dart';
import 'package:finily/ui/widgets/clipper/wave_clipper.dart';
import 'package:finily/ui/widgets/forms/input_checkbox.dart';
import 'package:finily/ui/widgets/forms/input_email.dart';
import 'package:finily/ui/widgets/forms/input_pasword.dart';
import 'package:finily/ui/widgets/forms/input_text.dart';
import 'package:finily/ui/widgets/text/tagline.dart';
import 'package:finily/ui/widgets/text/text_desc.dart';
import 'package:finily/ui/widgets/text/title.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: AppColors.textLight), // warna tombol back
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Wave background paling belakang
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.25,
              color: AppColors.primaryColor.withOpacity(0.3),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.2,
              color: AppColors.primaryColor,
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.25),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppStyle.mediumSpacing),
                child: Column(
                  children: [
                    TitleWidget(
                      text: AppStrings.register,
                      color: AppColors.primaryColor,
                    ),

                    Tagline(text: AppStrings.taglineRegister),

                    SizedBox(height: AppStyle.largeSpacing * 2),
                    Form(
                      child: Column(
                        children: [
                          InputText(),
                          SizedBox(height: AppStyle.mediumSpacing),
                          InputEmail(),
                          SizedBox(height: AppStyle.mediumSpacing),
                          InputPassword(),
                          SizedBox(height: AppStyle.mediumSpacing),
                          InputCheckbox(),
                          SizedBox(height: AppStyle.mediumSpacing * 2),
                          ButtonPrimary(
                            onPressed: () {},
                            text: AppStrings.register,
                          ),
                          SizedBox(height: AppStyle.smallSpacing),
                          Text(
                            AppStrings.taglineCreateAccount,
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: AppStyle.small,
                            ),
                          ),
                          SizedBox(height: AppStyle.largeSpacing),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: AppColors.textDark.withOpacity(0.3),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  AppStrings.or,
                                  style: TextStyle(
                                    color: AppColors.textDark,
                                    fontSize: AppStyle.h4,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppColors.textDark.withOpacity(0.3),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppStyle.largeSpacing),
                          ButtonSecondary(
                            onPressed: () {},
                            text: AppStrings.login,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
