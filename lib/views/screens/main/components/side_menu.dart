import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:trag_work/blocs/navigation_drawer/navigation_drawer_bloc.dart';
import 'package:trag_work/views/theme/theme.dart';
import 'package:trag_work/views/utils/responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100.0,
            child: DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          _DrawerList(),
          _ProfileCard(),
        ],
      ),
    );
  }
}

class _DrawerList extends StatelessWidget {
  const _DrawerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NavigationDrawerBloc, NavigationDrawerState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: CorePadding.big),
            children: [
              _DrawerListTile(
                title: "Dashboard",
                svgSrc: "assets/icons/menu_dashbord.svg",
                press: () {},
                selected: NavItem.page_one == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Food & Drinks",
                svgSrc: "assets/icons/menu_food.svg",
                press: () {},
                selected: NavItem.page_two == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Messages",
                svgSrc: "assets/icons/menu_messages.svg",
                press: () {},
                selected: NavItem.page_three == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Bills",
                svgSrc: "assets/icons/menu_bills.svg",
                press: () {},
                selected: NavItem.page_four == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Settings",
                svgSrc: "assets/icons/menu_settings.svg",
                press: () {},
                selected: NavItem.page_five == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Notifications",
                svgSrc: "assets/icons/menu_notifications.svg",
                press: () {},
                selected: NavItem.page_six == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Support",
                svgSrc: "assets/icons/menu_support.svg",
                press: () {},
                selected: NavItem.page_seven == state.selectedItem,
              ),
            ],
          );
        },
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
    required this.selected,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: selected ? CoreColors.primary : null,
        child: ListTile(
          onTap: press,
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            svgSrc,
            color: Colors.black87,
            height: 20,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black87),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: CorePadding.big),
      padding: EdgeInsets.symmetric(
        horizontal: CorePadding.normal,
        vertical: CorePadding.small,
      ),
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(
              "assets/images/profile_pic.jpeg",
            ),
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(vertical: CorePadding.small),
              child: Column(
                children: [
                  Text(
                    "Theresa Webb",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "work \u00B7 4h 56h",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: CorePadding.normal,
                  ),
                  Text(
                    "Open profile",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
