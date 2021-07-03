import 'package:flutter/material.dart';

import 'package:trag_work/views/screens/dashboard/components/jobs.dart';
import 'package:trag_work/views/theme/theme.dart';
import 'package:trag_work/views/utils/responsive.dart';

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      JobList(),
                      SizedBox(height: CorePadding.normal),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
