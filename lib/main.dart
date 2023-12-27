import 'package:flutter/material.dart';
import 'package:hein/users/authentication/login_screen.dart';
import 'package:get/get.dart';
import 'package:hein/users/fragments/dashboard_of_fragments.dart';
import 'package:hein/users/userPreferences/user_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HEIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder(
        future: RememberUserPrefs.readUserInfo(),
        builder: (context, dataSnapShot) {
          if (dataSnapShot.data == null) {
            return const LoginScreen();
          } else {
            return DashboardOfFragments();
          }
        },
      ),
    );
  }
}
