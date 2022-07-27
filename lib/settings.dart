import 'package:flutter/material.dart';

class settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black
        ),
        title: const Text("Settings",
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.redAccent, Colors.amber],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )
          ),
        ),
      ),
    );
  }
}

