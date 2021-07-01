import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

import 'package:trag_work/blocs/navigation_drawer/navigation_drawer_bloc.dart';
import 'package:trag_work/views/theme/theme.dart';
import 'package:trag_work/views/utils/responsive.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerBloc = BlocProvider.of<NavigationDrawerBloc>(context);

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              drawerBloc.add(OpenDrawer());
            },
          ),
        if (!Responsive.isMobile(context)) _BreadcrumbsCard(),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 1 : 1),
        Expanded(child: _SearchField()),
      ],
    );
  }
}

class _BreadcrumbsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Material(
            child: Ink(
              decoration: ShapeDecoration(
                color: CoreColors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(CoreContansts.borderRadius),
                ),
              ),
              child: IconButton(
                icon: Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: Icon(Icons.arrow_right_alt_sharp),
                ),
                onPressed: () {
                  print('pressed');
                },
              ),
            ),
          ),
          SizedBox(
            width: CorePadding.bigger,
          ),
          BreadCrumb(
            items: <BreadCrumbItem>[
              BreadCrumbItem(
                content: Text(
                  'Item1',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: CorePadding.small),
              ),
              BreadCrumbItem(
                content: Text(
                  'Item2',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: CorePadding.small),
              ),
            ],
            divider: Icon(Icons.chevron_right, color: Colors.black26),
          ),
        ],
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        prefixIcon: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(CorePadding.normal * 0.75),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  color: Colors.black87,
                  width: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
