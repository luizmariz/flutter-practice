import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MainAppBarWidget({
    super.key,
    this.height = 110,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              alignment: Alignment.centerLeft,
              child: const FaIcon(
                FontAwesomeIcons.barsStaggered,
                color: Color(0xff747474),
                size: 28,
              ),
            ),
            centerTitle: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Location",
                      style: TextStyle(fontSize: 12, color: Color(0xffc1c1c1)),
                    )),
                Text(
                  "Cameron St., Boston",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff545454),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            actions: const [
              CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/200"))
            ]),
      ),
    );
  }
}
