import 'package:flutter/material.dart';

import 'package:trag_work/theme/theme.dart';

import 'components/header.dart';
import 'components/jobs_list.dart';

class JobsContent extends StatelessWidget {
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
