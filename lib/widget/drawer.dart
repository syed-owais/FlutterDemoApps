import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl =
        "https://lh3.googleusercontent.com/QRuVMf87fa1xez3ueDoCPftZB0I2uJ28JGxB10BifSvU5mZ8h7bsW-aaVhp1ad7RHZXZ7cUwZAeqIB5zMOZdwz-HTbzLmj-ixDnp4V3iOcdtijE3mteHpZrTlJ-ETxwkYLFniPgxROFmyYhkbjejP9o3A-H9Oe0wX-JnV-tR8OoV_HQqs6PBVjS81WUgI4hBXeqweVNcdkq6CIF2APb5u5bE8r1zASdziVK7gc6n3vQTOL8B1tkxaC2PNKaFHZHhxV1JLnWZ_u3qADJa2V6XAs-5AbOUPX9hm2sDdGBS2mom7svUQqvWv9LyrK5f4aHelZ0aqz9wWdasO9jqLuiu6iYr3clrqqBuEDsauSRspAIZ6Vt1L3r1lIKb68ZHyoOsxdzA6OM8djxfmfwunVw4nN0MUKqng8r5u4D5UPUvwGp909jH3edk_vPcijUsq-ZvvklK9eB27cHmyB7VaWNj_H8-IwDcuEL0P3qGTV54yOlU3zAubunuwV98zH5IdjrEsBFy9-Cqv_iM6yfdWPDXFjUVlNkzEts0uICTNM0SlhQFkwwqic4KBMGzY1A5c09W0k8MoyJkC-2x0mfSDF8mOq6ad_T6Q30D_6aBH7I3CKWiYwDCuzgVrpMPNrC-w8lNx6hSkYS7jakjlHcg4YkdugpKc591oQIE7IXaKaDN0eOOsYwv2oHm5GZHwFaD1-TNirMlN-mpsPEvndmxwrHBDNE=w155-h232-no?authuser=0";
    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Syed Owais Ahmed"),
                accountEmail: Text("ar.shah192@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Inbox - ar.shah192@gmail.com",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
