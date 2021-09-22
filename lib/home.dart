import "package:flutter/material.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String numApp = "First";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to the $numApp Flutter App."),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
