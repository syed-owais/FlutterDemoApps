import 'package:first_app/Pages/home_details.dart';
import 'package:first_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalog.items.length,
      itemBuilder: (context, index) {
        final catalog = Catalog.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetail(
                  catalog: catalog,
                ),
              )),
          child: CatalogItem(catalog: catalog),
        );
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
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.img),
        ),
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
