import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trag_work/features/job/bloc/jobs_bloc.dart';
import 'package:trag_work/theme/theme.dart';
import 'package:trag_work/utils/responsive.dart';

import 'job_card.dart';

class JobList extends StatelessWidget {
  const JobList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Jobs",
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: CorePadding.normal * 1.5,
                  vertical: CorePadding.normal /
                      (Responsive.isMobile(context) ? 2 : 1),
                ),
                backgroundColor: CoreColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(CoreConstant.borderRadiusSmall),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
        SizedBox(height: CorePadding.normal),
        Responsive(
          mobile: _JobCardGridView(
            crossAxisCount: _size.width < Responsive.breakpointMobile ? 2 : 4,
            childAspectRatio:
                _size.width < Responsive.breakpointMobile ? 0.9 : 1,
          ),
          tablet: _JobCardGridView(),
          desktop: _JobCardGridView(
            crossAxisCount:
                _size.width < Responsive.breakpointDesktopLarge ? 3 : 4,
            childAspectRatio:
                _size.width < Responsive.breakpointDesktopLarge ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class _JobCardGridView extends StatelessWidget {
  const _JobCardGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        if (state is JobsLoading) {
          return const CircularProgressIndicator();
        }

        if (state is JobsLoaded) {
          final items = state.jobs.items;

          if (items != null && items.length > 0) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: CorePadding.normal,
                mainAxisSpacing: CorePadding.normal,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (context, index) => JobCard(info: items[index]),
            );
          } else {
            // TODO: Pending mockup
            return const Text('There are no jobs');
          }
        }

        // ERROR
        return const Text('Something went wrong!');
      },
    );
  }
}
