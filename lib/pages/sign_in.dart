import 'package:firebase_auth/firebase_auth.dart';
import 'package:firepost/pages/home_page.dart';
import 'package:firepost/pages/signup_paeg.dart';
import 'package:firepost/services/auth_service.dart';
import 'package:firepost/services/utilis_service.dart';
import 'package:flutter/material.dart';

import '../services/prefs_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = 'sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailCotrller = TextEditingController();
  final _passwordController = TextEditingController();

  void _doSignIn() {
    String email = _emailCotrller.text.toString().trim();
    String password = _passwordController.text.toString().trim();
if(email.isEmpty||password.isEmpty)return;
    AuthService.signInUser(context, email, password).then((firebaseUser) =>
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
              controller: _emailCotrller,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),

              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),

              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  onPrimary: Colors.white,

                ),
                onPressed: _doSignIn,
                child: const Text('Sign In', style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold,),),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: TextButton(

                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Do not have an account', style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold,),),
                      SizedBox(width: 10,),
                      Text('Sign Up', style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold,),),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),

    );
  }
}
