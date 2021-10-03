import 'package:first_app/models/catalog.dart';
import 'package:first_app/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Items catalog;
  const HomeDetail({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyThemes.creamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}"
              .text
              .xl4
              .color(MyThemes.defaultThemeColor)
              .bold
              .make(),
          ElevatedButton(
            onPressed: () {},
            child: "Buy".text.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyThemes.darkBlueishColor),
                shape: MaterialStateProperty.all(StadiumBorder())),
          ).wh(100, 45)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.img),
              ).h32(context),
              Expanded(
                child: VxArc(
                  height: 30,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyThemes.darkBlueishColor)
                            .bold
                            .make(),
                        Text(
                          catalog.desc,
                          style: context.captionStyle,
                          textScaleFactor: 1.1,
                        ),
                        10.heightBox,
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
