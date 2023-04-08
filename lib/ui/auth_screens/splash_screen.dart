import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager/data/auth_utils.dart';
import 'package:taskmanager/ui/auth_screens/login_screen.dart';
import 'package:taskmanager/ui/display_screens/main_bottom_navbar.dart';
import '../pages/scrn_bg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2))
        .then((value) => checkAuthUserStae());
  }

  Future<void> checkAuthUserStae() async {
    final bool result = await AuthUtils.checkLoginState();
    if (result) {
      await AuthUtils.getAuthData();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainBottomNavBar()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
          widget: Center(
              child: SvgPicture.asset(
        "assets/images/task.svg",
        fit: BoxFit.scaleDown,
      ))),
    );
  }
}
