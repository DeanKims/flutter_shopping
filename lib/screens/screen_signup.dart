import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late bool _isSigningUp;
  @override
  void initState() {
    _isSigningUp = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            _isSigningUp
                ? LinearProgressIndicator()
                : Padding(padding: EdgeInsets.all(3)),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isSigningUp = true;
                  });
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('회원가입성공!'),
                      ),
                    );
                    Navigator.of(context).pushNamed('/signin');
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message ?? 'Error!')));
                  } finally {
                    setState(() {
                      _isSigningUp = false;
                    });
                  }
                },
                child: Text('회원가입')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/signin');
                },
                child: Text('이미 회원이신가요? 로그인')),
          ],
        ),
      ),
    );
  }
}
