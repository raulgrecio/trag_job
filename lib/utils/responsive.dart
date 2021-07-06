import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static const breakpointMobile = 600.0;
  static const breakpointTablet = 1024.0;
  static const breakpointDesktopLarge = 1264.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < breakpointMobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < breakpointTablet &&
      MediaQuery.of(context).size.width >= breakpointMobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= breakpointTablet;

  static bool portrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if (_size.width >= 1100) {
      return desktop;
    } else if (_size.width >= 600 && tablet != null) {
      return tablet!;
    }

    return mobile;
  }
}
