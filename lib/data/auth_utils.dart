import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static String? firstName, lastName, token, profilePhoto, mobile, email;

  static Future<void> saveUserData(
      String userfirstName,
      String userlastName,
      String userToken,
      String userMobile,
      String userProfilepic,
      String userEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', userToken);
    await sharedPreferences.setString('firstName', userfirstName);
    await sharedPreferences.setString('lastName', userlastName);
    await sharedPreferences.setString('profilePhoto', userProfilepic);
    await sharedPreferences.setString('mobile', userMobile);
    await sharedPreferences.setString('email', userEmail);

    firstName = userfirstName;
    lastName = userlastName;
    token = userToken;
    profilePhoto = userProfilepic;
    mobile = userMobile;
    email = userEmail;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> getAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    firstName = sharedPreferences.getString('firstName');
    lastName = sharedPreferences.getString('lastName');
    mobile = sharedPreferences.getString('mobile');
    profilePhoto = sharedPreferences.getString('photo');
    email = sharedPreferences.getString('email');
  }

  static Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
