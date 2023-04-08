import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/data/auth_utils.dart';
import 'package:taskmanager/ui/auth_screens/login_screen.dart';
import 'package:taskmanager/ui/display_screens/update_profile_screen.dart';

class UserProfileBar extends StatelessWidget {
  const UserProfileBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const UpdateProfileScreen()));
      },
      leading: CircleAvatar(
          maxRadius: 20,
          child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/2990/2990662.png')),
      title: Text("${AuthUtils.firstName ?? ""} ${AuthUtils.lastName ?? ""}",
          style: GoogleFonts.ubuntu()),
      subtitle: Text(AuthUtils.email ?? "unknown", style: GoogleFonts.ubuntu()),
      tileColor: Colors.green,
      trailing: IconButton(
        icon: const Icon(Icons.logout_outlined),
        iconSize: 30,
        onPressed: () async {
          await AuthUtils.clearData();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        },
      ),
    );
  }
}
