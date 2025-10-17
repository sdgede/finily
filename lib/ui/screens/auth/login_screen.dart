import 'package:finily/res/asset/call_assets.dart';
import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/string/string.dart';
import 'package:finily/res/style/style.dart';
import 'package:finily/routes/auth_route.dart';
import 'package:finily/ui/widgets/buttons/primary_button.dart';
import 'package:finily/ui/widgets/buttons/secondary_button.dart';
import 'package:finily/ui/widgets/clipper/wave_clipper.dart';
import 'package:finily/ui/widgets/forms/input_text.dart';
import 'package:finily/ui/widgets/text/tagline.dart';
import 'package:finily/ui/widgets/text/title.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      debugPrint("✅ Login sukses, lanjut ke dashboard...");
    } else {
      debugPrint("❌ Login gagal, cek input user");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: BackButton(color: AppColors.textLight),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Wave background
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.23,
              color: AppColors.primaryColor.withOpacity(0.23),
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
              padding: EdgeInsets.only(top: size.height * 0.2),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppStyle.smallSpacing),
                child: Column(
                  children: [
                    TitleWidget(
                      text: AppStrings.login,
                      color: AppColors.primaryColor,
                    ),
                    Tagline(text: AppStrings.taglineLogin),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(CallAssets.login),
                            height: size.height * 0.25,
                          ),
                          InputText(
                            label: "Email",
                            hint: "Enter your email",
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Email required";
                              }
                              if (!val.contains("@")) {
                                return "Invalid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppStyle.mediumSpacing),
                          InputText(
                            label: "Password",
                            hint: "Enter your password",
                            controller: passwordController,
                            obscureText: true,
                            prefixIcon: Icons.lock,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Password required";
                              }
                              if (val.length < 6) {
                                return "Min 6 characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppStyle.mediumSpacing * 2),
                          ButtonPrimary(
                            onPressed: _onLogin,
                            text: AppStrings.login,
                          ),
                          SizedBox(height: AppStyle.smallSpacing),
                          Text(
                            AppStrings.taglineLoginBusiness,
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: AppStyle.small,
                            ),
                            textAlign: TextAlign.center,
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
                                  AppStrings.notHaveAccount,
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
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AuthRoute.register);
                            },
                            text: AppStrings.register,
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
