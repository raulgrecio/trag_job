import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:trag_work/blocs/navigation_drawer/navigation_drawer_bloc.dart';
import 'package:trag_work/views/theme/theme.dart';
import 'package:trag_work/views/utils/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerBloc = BlocProvider.of<NavigationDrawerBloc>(context);

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('pasa por aqui');
              print(drawerBloc);
              drawerBloc.add(OpenDrawer());
            },
          ),
        if (!Responsive.isMobile(context))
          Text(
            "TragWork",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context)) _BreadcrumbsCard(),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: _SearchField()),
      ],
    );
  }
}

class _BreadcrumbsCard extends StatelessWidget {
  const _BreadcrumbsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: CorePadding.normal),
      padding: EdgeInsets.symmetric(
        horizontal: CorePadding.normal,
        vertical: CorePadding.smaller,
      ),
      decoration: BoxDecoration(
        color: CoreColors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: CorePadding.smaller),
              child: Text("Theresa Webb"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    Key? key,
  }) : super(key: key);

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
