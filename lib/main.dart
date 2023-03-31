import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:residanat_alger_seances_en_linge/Screens/AboutUs.dart';
import 'package:residanat_alger_seances_en_linge/Screens/AllBoard.dart';
import 'package:residanat_alger_seances_en_linge/Screens/Login.dart';
import 'package:residanat_alger_seances_en_linge/Screens/NavigatorScreen.dart';
import 'package:residanat_alger_seances_en_linge/Screens/Payment.dart';
import 'package:residanat_alger_seances_en_linge/Screens/Register.dart';
import 'package:residanat_alger_seances_en_linge/Screens/RegisterProfile.dart';
import 'package:residanat_alger_seances_en_linge/Screens/SplashScreen.dart';
import 'package:residanat_alger_seances_en_linge/Services/courseService.dart';
import 'package:residanat_alger_seances_en_linge/Services/userService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'Models/AppSettings.dart';
import 'package:residanat_alger_seances_en_linge/firebase_options.dart';
import 'Screens/ChangePassword.dart';
import 'Screens/EmailVerify.dart';
import 'Screens/ForgetPassword.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppSettings.dark = prefs.getBool('dark') ?? true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettings()),
        ChangeNotifierProvider(create: (_) => userService()),
        ChangeNotifierProvider(create: (_) => courseService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '//',
      routes: {
        '//' : (_) => const SplashScreen(),
        '/signin' : (_) => const Login(),
        '/register' : (_) => const Register(),
        '/emailverify' : (context) => const EmailVerify(),
        '/registerprofile' : (_) => const RegisterProfile(),
        '/navigatorscreen' : (_) => const  NavigatorScreen(),
        '/changepassword' : (_) => const ChangePassword(),
        '/payment' : (_) => const Payment(),
        '/allboard' : (_) => const AllBoard(),
        '/forgetpassword' : (_) => const ForgetPassword(),
        '/aboutus' : (_) => const AboutUS()
      },
      home: const SplashScreen(),
    );
  }
}