import 'package:flutter/material.dart';

class homePage extends StatelessWidget {

  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Text("Home Page",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36)
        ),
      ),
    );
  }
}
