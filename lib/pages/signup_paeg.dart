import 'package:firebase_auth/firebase_auth.dart';
import 'package:firepost/pages/sign_in.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../services/prefs_service.dart';
import '../services/utilis_service.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = 'signup_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailCotrller = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();

  void _doSignUp() {
    String email = _emailCotrller.text.toString().trim();
    String password = _passwordController.text.toString().trim();
    String fullName = _fullNameController.text.toString().trim();

    AuthService.signUpUser(context, email, password,fullName).then((firebaseUser) =>
    {
      _getfirebaseUser(firebaseUser)
    });
  }
  void _getfirebaseUser(User? firebaseUser)async{
    if(firebaseUser!=null){
      await Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushNamed(context,HomePage.id);
    }else{
      Utils.fireToast('check email or password');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                hintText: 'FullName',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailCotrller,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  onPrimary: Colors.white,
                ),
                onPressed: _doSignUp,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignIn.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
