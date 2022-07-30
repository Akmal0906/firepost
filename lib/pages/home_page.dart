import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
static const String id='home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:SizedBox(
          height: 45,
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.deepPurpleAccent,
            ),
            child: const Text('Log Out'),
            onPressed: (){

            },
          ),
        ),
      ),
    );
  }
}
