import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileBar extends StatelessWidget {
  const UserProfileBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          maxRadius: 20,
          child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/2990/2990662.png')),
      title: Text("Saon Sikder", style: GoogleFonts.ubuntu()),
      subtitle: Text("saonsikder@gmail.com", style: GoogleFonts.ubuntu()),
      tileColor: Colors.green,
    );
  }
}
