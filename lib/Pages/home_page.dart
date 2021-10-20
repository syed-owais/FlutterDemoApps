import 'dart:convert';

import 'package:first_app/core/store.dart';
import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widget/home_wiget/catalog_header.dart';
import 'package:first_app/widget/home_wiget/catalog_list.dart';
import 'package:first_app/widget/themes.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/61706c94aa02be1d445c542b";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    var response = await http.get(Uri.parse(url));
    var jsonStringData = response.body;
    // await rootBundle.loadString("assets/files/catalog.json");

    var jsonData = jsonDecode(jsonStringData)["products"];
    Catalog.items =
        List.from(jsonData).map<Items>((item) => Items.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as Mystore).cart;
    const String numApp = "First";
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      floatingActionButton: VxBuilder(
        builder: (ctx, Mystore, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),
          child: const Icon(CupertinoIcons.cart, color: Colors.white),
          backgroundColor: context.theme.buttonColor,
        ).badge(
            count: _cart.items.length,
            size: 20,
            color: MyThemes.defaultThemeColor),
        mutations: const {AddMutation, RemoveMutation},
      ),
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
