import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:trag_work/views/utils/constants.dart' as constants;
import 'package:trag_work/views/utils/responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          _DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {},
          ),
          _DrawerListTile(
            title: "Food & Drinks",
            svgSrc: "assets/icons/menu_food.svg",
            press: () {},
          ),
          _DrawerListTile(
            title: "Messages",
            svgSrc: "assets/icons/menu_messages.svg",
            press: () {},
          ),
          _DrawerListTile(
            title: "Bills",
            svgSrc: "assets/icons/menu_bills.svg",
            press: () {},
          ),
          _DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_settings.svg",
            press: () {},
          ),
          _DrawerListTile(
            title: "Notifications",
            svgSrc: "assets/icons/menu_notifications.svg",
            press: () {},
          ),
          _DrawerListTile(
            title: "Support",
            svgSrc: "assets/icons/menu_support.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.black87,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: constants.defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: constants.defaultPadding,
        vertical: constants.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: constants.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.jpeg",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: constants.defaultPadding / 2),
              child: Text("Angelina Joli"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
