import 'package:finily/res/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Upss! Page not found!',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 16),
            LottieBuilder.asset('assets/lottie/error.json'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
