import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping/firebase_options.dart';
import 'package:shopping/screens/screen_home.dart';
import 'package:shopping/screens/screen_signin.dart';
import 'package:shopping/screens/screen_signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Home Page',
      initialRoute: 'signup',
      routes: {
        '/': (context) => HomeScreen(),
        '/signup': (context) => SignupScreen(),
        '/signin': (context) => SigninScreen(),
      },
    );
  }
}

//Navigator.of(context