import 'package:first_app/widget/drawer.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String numApp = "First";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: const Text("Welcome to the $numApp Flutter App."),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
