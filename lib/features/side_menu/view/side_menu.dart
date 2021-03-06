import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:trag_work/features/side_menu/bloc/side_menu_bloc.dart';
import 'package:trag_work/theme/theme.dart';
import 'package:trag_work/utils/responsive.dart';

const logoHeight = 100.0;
const elevation = 16.0;

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final topPadding = mediaQuery.padding.top;
    final minHeight = mediaQuery.size.height - logoHeight - topPadding;

    return Drawer(
      elevation: (!Responsive.isDesktop(context)) ? elevation : 0,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _DrawerLogo(height: logoHeight),
            Expanded(
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: minHeight,
                    ),
                    child: Column(
                      children: [
                        _DrawerList(),
                        Spacer(),
                        _ProfileCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerLogo extends StatelessWidget {
  const _DrawerLogo({
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      child: DrawerHeader(
        margin: const EdgeInsets.only(bottom: 0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(
            CorePadding.normal,
            CorePadding.smaller,
            CorePadding.normal,
            CorePadding.normal,
          ),
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}

class _DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerBloc = BlocProvider.of<NavigationDrawerBloc>(context);

    return BlocBuilder<NavigationDrawerBloc, NavigationDrawerState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CorePadding.normal, vertical: CorePadding.normal),
          child: Column(
            children: [
              _DrawerListTile(
                title: "Dashboard",
                svgSrc: "assets/icons/menu/dashbord_menu.svg",
                press: () {
                  drawerBloc.add(NavigateTo(NavItem.page_one));
                },
                selected: NavItem.page_one == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Jobs",
                svgSrc: "assets/icons/menu/works_menu.svg",
                press: () {
                  drawerBloc.add(NavigateTo(NavItem.page_two));
                },
                selected: NavItem.page_two == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Messages",
                svgSrc: "assets/icons/menu/messages_menu.svg",
                press: () {
                  drawerBloc.add(NavigateTo(NavItem.page_three));
                },
                selected: NavItem.page_three == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Bills",
                svgSrc: "assets/icons/menu/bills_menu.svg",
                press: () {
                  drawerBloc.add(NavigateTo(NavItem.page_four));
                },
                selected: NavItem.page_four == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Settings",
                svgSrc: "assets/icons/menu/settings_menu.svg",
                press: () {
                  drawerBloc.add(NavigateTo(NavItem.page_five));
                },
                selected: NavItem.page_five == state.selectedItem,
              ),
              _DrawerCategoryTile(
                title: "Other",
              ),
              _DrawerListTile(
                title: "Notifications",
                svgSrc: "assets/icons/menu/notifications_menu.svg",
                press: () {
                  drawerBloc.add(NavigateTo(NavItem.page_six));
                },
                selected: NavItem.page_six == state.selectedItem,
              ),
              _DrawerListTile(
                title: "Support",
                svgSrc: "assets/icons/menu/support_menu.svg",
                press: () {
                  drawerBloc.add(NavigateTo(NavItem.page_seven));
                },
                selected: NavItem.page_seven == state.selectedItem,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DrawerCategoryTile extends StatelessWidget {
  const _DrawerCategoryTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        title,
        style: Theme.of(context).textTheme.caption,
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
      borderRadius: BorderRadius.circular(CoreConstant.borderRadiusSmall),
      child: Container(
        color: selected ? CoreColors.primary : null,
        child: ListTile(
          onTap: !selected ? press : null,
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            svgSrc,
            color: Colors.black87,
            height: CoreConstant.sizeIcon,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black87),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CoreConstant.borderRadiusSmall),
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
      margin: const EdgeInsets.only(bottom: CorePadding.big),
      padding: const EdgeInsets.symmetric(
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
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Open profile",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
