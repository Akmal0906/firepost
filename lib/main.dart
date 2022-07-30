
import 'package:firebase_core/firebase_core.dart';
import 'package:firepost/pages/home_page.dart';
import 'package:firepost/pages/sign_in.dart';
import 'package:firepost/pages/signup_paeg.dart';
import 'package:flutter/material.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
      routes: {
        SignUpPage.id:(context)=>const SignUpPage(),
        SignIn.id:(context)=>const SignIn(),
        HomePage.id:(context)=>const HomePage(),
      },
    );
  }
}

