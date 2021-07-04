import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

import 'package:trag_work/blocs/navigation_drawer/navigation_drawer_bloc.dart';
import 'package:trag_work/models/ui/breadcrumb_item_model.dart';
import 'package:trag_work/views/theme/theme.dart';
import 'package:trag_work/views/utils/responsive.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerBloc = BlocProvider.of<NavigationDrawerBloc>(context);

    return Row(
      children: [
        _SideIcon(drawerBloc: drawerBloc),
        SizedBox(width: CorePadding.normal),
        if (!Responsive.isMobile(context)) _BreadcrumbsCard(),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 1 : 1),
        Expanded(child: _SearchField()),
      ],
    );
  }
}

class _SideIcon extends StatelessWidget {
  const _SideIcon({
    Key? key,
    required this.drawerBloc,
  }) : super(key: key);

  final NavigationDrawerBloc drawerBloc;

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isDesktop(context))
      return ClipRRect(
        borderRadius: BorderRadius.circular(CoreConstant.borderRadius),
        child: Material(
          child: IconButton(
            padding: const EdgeInsets.all(CorePadding.normal),
            icon: Icon(Icons.menu),
            onPressed: () {
              drawerBloc.add(OpenDrawer());
            },
          ),
        ),
      );

    return ClipRRect(
      borderRadius: BorderRadius.circular(CoreConstant.borderRadius),
      child: Material(
        child: Ink(
          decoration: ShapeDecoration(
            color: CoreColors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(CoreConstant.borderRadius),
            ),
          ),
          child: IconButton(
            padding: const EdgeInsets.all(CorePadding.normal),
            icon: Transform.rotate(
              angle: 180 * math.pi / 180,
              child: Icon(Icons.arrow_right_alt_sharp),
            ),
            onPressed: () {
              // TODO: CAMBIAR ESTO PARA QUE HABRA EL DRAWER
              print('pressed');
            },
          ),
        ),
      ),
    );
  }
}

class _BreadcrumbsCard extends StatelessWidget {
  final List<BreadcrumbItemModel> breadCrumbItems = [
    BreadcrumbItemModel(title: 'itemA', onTap: () {}),
    BreadcrumbItemModel(title: 'itemB', onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: CorePadding.normal),
      child: BreadCrumb.builder(
        itemCount: breadCrumbItems.length,
        builder: (index) {
          final item = breadCrumbItems[index];
          return BreadCrumbItem(
            content: Text(
              item.title,
              style: breadCrumbItems.length == index + 1
                  ? Theme.of(context).textTheme.bodyText2
                  : Theme.of(context).textTheme.bodyText1,
            ),
            padding: const EdgeInsets.symmetric(horizontal: CorePadding.small),
            onTap: item.onTap,
          );
        },
        divider: Icon(Icons.chevron_right, color: Colors.black26),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.black38),
        fillColor: CoreColors.grey,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
              Radius.circular(CoreConstant.borderRadius)),
        ),
        prefixIcon: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(CorePadding.normal * 0.75),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(CoreConstant.borderRadius)),
                ),
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  color: Colors.black87,
                  width: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
