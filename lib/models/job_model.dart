import 'package:flutter/material.dart';

class JobModel {
  final String? svgSrc;
  final String? title;
  final double? duration;
  final String? date;
  final int? percentage;
  final Color? color;

  JobModel({
    this.svgSrc,
    this.title,
    this.duration,
    this.date,
    this.percentage,
    this.color,
  });
}

List demoJobs = [
  JobModel(
    title: "Dron",
    date: "2021-07-01 13:33:29.971Z",
    svgSrc: "assets/icons/jobs/dron_flat.svg",
    duration: 0.7,
    color: Color(0XFFF44336),
    percentage: 35,
  ),
  JobModel(
    title: "Growth information",
    date: "2021-07-01 13:33:29.971Z",
    svgSrc: "assets/icons/jobs/information_flat.svg",
    duration: 0.7,
    color: Color(0XFF3F51B5),
    percentage: 35,
  ),
  JobModel(
    title: "Irrigation",
    date: "2021-07-01 13:33:29.971Z",
    svgSrc: "assets/icons/jobs/irrigation_flat.svg",
    duration: 0.7,
    color: Color(0XFF00BCD4),
    percentage: 10,
  ),
  JobModel(
    title: "Castel",
    date: "2021-07-01 13:33:29.971Z",
    svgSrc: "assets/icons/jobs/cow_flat.svg",
    duration: 0.7,
    color: Color(0XFF795548),
    percentage: 78,
  ),
  JobModel(
    title: "Measure",
    date: "2021-07-01 13:33:29.971Z",
    svgSrc: "assets/icons/jobs/measure_flat.svg",
    duration: 0.7,
    color: Color(0XFF4CAF50),
    percentage: 78,
  ),
  JobModel(
    title: "Castel",
    date: "2021-07-01 13:33:29.971Z",
    svgSrc: "assets/icons/jobs/pig_flat.svg",
    duration: 0.7,
    color: Color(0XFFFF9800),
    percentage: 78,
  ),
];
