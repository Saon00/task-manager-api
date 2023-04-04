import 'package:flutter/material.dart';

class EnterButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onTap;
  const EnterButton({
    super.key,
    required this.widget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade300,
            padding: const EdgeInsets.all(10)),
        child: widget,
      ),
    );
  }
}
