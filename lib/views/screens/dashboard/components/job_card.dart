import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:trag_work/models/job_model.dart';

import 'package:trag_work/views/theme/theme.dart';
import 'package:trag_work/views/widgets/icon_job_widget.dart';
import 'package:trag_work/views/widgets/progress_line_widget.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final JobModel info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(CorePadding.normal),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            const BorderRadius.all(Radius.circular(CoreConstant.borderRadius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.more_vert, color: Colors.black54)],
          ),
          Row(
            children: [
              JobIcon(
                info.svgSrc!,
                color: info.color!,
                size: 60,
              ),
              SizedBox(width: CorePadding.normal),
              Text(
                info.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          ProgressLine(
            color: info.color,
            percentage: info.percentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.duration} hours",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.black87),
              ),
              Text(
                DateFormat('yy-MM-dd', 'ln').format(DateTime.parse(info.date!)),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
