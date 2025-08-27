import 'package:flutter/material.dart';
import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/string/string.dart';
import 'package:finily/res/style/style.dart';
import 'package:finily/routes/auth_route.dart';
import 'package:finily/ui/widgets/buttons/primary_button.dart';
import 'package:finily/ui/widgets/buttons/secondary_button.dart';
import 'package:finily/ui/widgets/clipper/wave_clipper.dart';
import 'package:finily/ui/widgets/forms/input_checkbox.dart';
import 'package:finily/ui/widgets/forms/input_text.dart';
import 'package:finily/ui/widgets/text/tagline.dart';
import 'package:finily/ui/widgets/text/title.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      debugPrint("✅ Form valid, lanjut register...");
    } else {
      debugPrint("❌ Form invalid, cek input user");
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
                      key: _formKey, // ✅ pakai formKey yg konsisten
                      child: Column(
                        children: [
                          InputText(
                            label: "Name",
                            hint: "Enter your name",
                            controller: nameController,
                            prefixIcon: Icons.person,
                            validator:
                                (val) =>
                                    val == null || val.isEmpty
                                        ? "Name required"
                                        : null,
                          ),
                          SizedBox(height: AppStyle.mediumSpacing),
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
                          SizedBox(height: AppStyle.mediumSpacing),
                          InputCheckbox(),
                          SizedBox(height: AppStyle.mediumSpacing * 2),

                          ButtonPrimary(
                            onPressed: _onRegister,
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
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(AuthRoute.login);
                            },
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
