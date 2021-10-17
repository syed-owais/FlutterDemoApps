import 'package:first_app/models/catalog.dart';
import 'package:first_app/widget/home_wiget/add_to_cart.dart';
import 'package:first_app/widget/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Items catalog;
  const HomeDetail({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
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
          AddToCart(catalog: catalog).wh(100, 45)
        ],
      ).p32().backgroundColor(context.cardColor),
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
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        Text(
                          catalog.desc,
                          style: context.captionStyle,
                          textScaleFactor: 1.1,
                        ),
                        Text(
                          "Lorem ipsom, D/ViewRootImpl( 3079): [TouchInput][ViewRootImpl] KeyEvent { action=ACTION_UP, keyCode=KEYCODE_BACK, scanCode=0, metaState=0, flags=0x8, repeatCount=0, eventTime=63706241, downTime=63706241, deviceId=-1, source=0x101, displayId=-1 }",
                          style: context.captionStyle,
                          textScaleFactor: 1.1,
                        ).p16(),
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
