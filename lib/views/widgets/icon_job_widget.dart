import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:trag_work/views/theme/theme.dart';

class JobIcon extends StatelessWidget {
  const JobIcon(
    this.svgSrc, {
    Key? key,
    this.color = const Color(0xFFCDCDCD),
    this.size = 60.0,
  })  : this._radius = size >= CoreConstant.borderRadius * 3
            ? CoreConstant.borderRadius
            : size / 3,
        this._padding = size >= CorePadding.normal * 3
            ? CorePadding.normal * 0.75
            : size / 3 * 0.75,
        super(key: key);

  final String svgSrc;
  final Color color;
  final double size;
  final double _radius;
  final double _padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_padding),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(_radius)),
      ),
      child: SvgPicture.asset(
        svgSrc,
        color: color,
      ),
    );
  }
}
