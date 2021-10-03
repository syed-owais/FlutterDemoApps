import 'dart:convert';

import 'package:first_app/models/catalog.dart';
import 'package:first_app/widget/Item-widget.dart';
import 'package:first_app/widget/drawer.dart';
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
                CatalogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.xl5.color(MyThemes.darkBlueishColor).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalog.items.length,
      itemBuilder: (context, index) {
        final catalog = Catalog.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Items catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.img),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyThemes.darkBlueishColor).bold.make(),
              Text(catalog.desc, style: context.captionStyle),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.xl.bold.make(),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Buy".text.make(),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            MyThemes.darkBlueishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                  )
                ],
              ).pOnly(right: 16.00)
            ],
          ),
        )
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyThemes.creamColor)
        .make()
        .p16()
        .wh40(context);
  }
}
