import 'package:finily/res/asset/call_assets.dart';
import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/string/action_text.dart';
import 'package:finily/res/style/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int selectedIndex = 0; // default perusahaan yang dipilih

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 50),

            Image.asset(CallAssets.logo),
            const SizedBox(height: 16),

            Text(
              "Our your Company",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Daftar company scrollable
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: rowItemCompany(
                      name: "Company ${index + 1}",
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10),
                itemCount: 5,
              ),
            ),

            // Tombol di bawah
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: Text(
                  ActionText.createCompany,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row rowItemCompany({required String name, required bool isSelected}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [AppColors.secondaryColor, AppColors.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      const SizedBox(width: 10),
      Text(
        name,
        style: TextStyle(color: AppColors.textDark, fontSize: AppStyle.h2),
      ),
      const Spacer(),
      if (isSelected)
        Icon(
          FontAwesomeIcons.check,
          color: Colors.green,
          size: 16,
        ), // hanya tampil kalau selected
    ],
  );
}
