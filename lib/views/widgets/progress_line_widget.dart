import 'package:flutter/material.dart';

import 'package:trag_work/views/theme/theme.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = CoreColors.primary,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius:
                BorderRadius.all(Radius.circular(CoreConstant.borderRadius)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.all(Radius.circular(CoreConstant.borderRadius)),
            ),
          ),
        ),
      ],
    );
  }
}
