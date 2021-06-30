import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trag_work/controllers/MenuController.dart';
import 'package:trag_work/views/screens/dashboard/dashboard_screen.dart';
import 'package:trag_work/views/screens/main/components/side_menu.dart';
import 'package:trag_work/views/utils/responsive.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
