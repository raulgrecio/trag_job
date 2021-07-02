import 'package:flutter/material.dart';

import 'package:trag_work/views/theme/theme.dart';

import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(CorePadding.normal),
        child: Column(
          children: [
            Header(),
            SizedBox(height: CorePadding.normal),
          ],
        ),
      ),
    );
  }
}
