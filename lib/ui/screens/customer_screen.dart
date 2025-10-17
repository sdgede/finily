import 'package:finily/res/colors/colors.dart';
import 'package:finily/res/constant/routes.dart';
import 'package:finily/res/style/style.dart';
import 'package:finily/ui/widgets/appbart/appbar_default.dart';
import 'package:finily/ui/widgets/buttons/center_create_button.dart';
import 'package:finily/ui/widgets/buttons/floating_butoon.dart';
import 'package:finily/ui/widgets/card/contume_card.dart';
import 'package:finily/ui/widgets/card/drawer.dart';
import 'package:finily/ui/widgets/clipper/wave_clipper.dart';
import 'package:finily/ui/widgets/forms/input_search.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appbarDefault(text: "Customer", onTap: () {}),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      drawer: DrawerWidget(),
      body: Stack(
        children: [
          // background wave
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.45,
              color: AppColors.primaryColor.withOpacity(0.25),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: size.height * 0.40,
              color: AppColors.primaryColor,
            ),
          ),

          // content
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppStyle.largeSpacing),
            child: Column(
              children: [
                const SizedBox(height: 100),
                InputSearch(),
                const SizedBox(height: 20),
                CustemerItem(),
                const SizedBox(height: 20),
                CustemerItem(),
                const SizedBox(height: 20),
                CustemerItem(),
                const SizedBox(height: 20),
                CustemerItem(),
                const SizedBox(height: 20),
                CustemerItem(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: invoiceCreate(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: floatingButton(),
    );
  }

  BottomAppBar floatingButton() {
    return BottomAppBar(
      height: 75,
      color: AppColors.primaryColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem(
            icon: Icons.home,
            label: "Home",
            index: 0,
            currentIndex: activeIndex,
            onPress: () {
              setState(() => activeIndex = 0);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              );
            },
          ),
          buildNavItem(
            icon: Icons.people,
            label: "Customer",
            index: 1,
            currentIndex: activeIndex,
            onPress: () {
              setState(() => activeIndex = 1);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.customer,
                (route) => false,
              );
            },
          ),
          const SizedBox(width: 40), // space for FAB
          buildNavItem(
            icon: Icons.settings,
            label: "Settings",
            index: 2,
            currentIndex: activeIndex,
            onPress: () {
              setState(() => activeIndex = 2);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              );
            },
          ),
          buildNavItem(
            icon: Icons.person,
            label: "Profile",
            index: 3,
            currentIndex: activeIndex,
            onPress: () {
              setState(() => activeIndex = 3);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.profile,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
