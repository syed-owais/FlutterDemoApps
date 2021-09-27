import 'dart:convert';

import 'package:first_app/models/catalog.dart';
import 'package:first_app/widget/Item-widget.dart';
import 'package:first_app/widget/drawer.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var jsonStringData =
        await rootBundle.loadString("assets/files/catalog.json");
    var jsonData = jsonDecode(jsonStringData)["product"];
    Catalog.items =
        List.from(jsonData).map<Items>((item) => Items.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(50, (index) => Catalog.items[0]);
    const String numApp = "First";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: (Catalog.items.isNotEmpty)
            ? ListView.builder(
                itemCount: Catalog.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: Catalog.items[index],
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: const MyDrawer(),
    );
  }
}
