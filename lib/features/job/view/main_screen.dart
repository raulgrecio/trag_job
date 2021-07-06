import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trag_work/features/job/view/jobs_content.dart';
import 'package:trag_work/features/side_menu/side_menu.dart';
import 'package:trag_work/utils/responsive.dart';

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
          child: Icon(Icons.menu),
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
                flex: 10,
                child: JobsContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
