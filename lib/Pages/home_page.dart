import 'dart:convert';

import 'package:first_app/models/catalog.dart';
import 'package:first_app/widget/home_wiget/catalog_header.dart';
import 'package:first_app/widget/home_wiget/catalog_list.dart';
import 'package:first_app/widget/themes.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (Catalog.items != null && Catalog.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                ).expand()
            ],
          ),
        ),
      ),
    );
  }
}
