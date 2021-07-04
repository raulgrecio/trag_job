import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trag_work/blocs/navigation_drawer/navigation_drawer_bloc.dart';
import 'package:trag_work/views/screens/job/jobs_screen.dart';
import 'package:trag_work/views/utils/responsive.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerBloc = BlocProvider.of<NavigationDrawerBloc>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: drawerBloc.scaffoldKey,
        drawer: SideMenu(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit_sharp),
          onPressed: () {
            drawerBloc.add(NavigateTo(NavItem.page_null));
            if (!Responsive.isDesktop(context)) {
              drawerBloc.add(OpenDrawer());
            }
          },
        ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: SideMenu(),
                ),
              Expanded(
                flex: 8,
                child: JobsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
