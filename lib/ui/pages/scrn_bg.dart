import 'package:flutter/material.dart';

class ScreenBG extends StatelessWidget {
  final Widget widget;
  const ScreenBG({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    final Size scrnSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/Clouds.png',
            fit: BoxFit.fill,
            width: scrnSize.width,
            height: scrnSize.height,
          ),
          widget,
        ],
      ),
    );
  }
}
