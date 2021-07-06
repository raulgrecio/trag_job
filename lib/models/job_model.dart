import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class JobModel {
  final int type;
  final String title;
  final String date;
  final int percentage;
  final double duration;
  final String svgSrc;
  final Color color;

  const JobModel._(
    this.type,
    this.title,
    this.date,
    this.percentage,
    this.duration,
    this.svgSrc,
    this.color,
  );

  factory JobModel({
    required int type,
    required String title,
    required String date,
    required int percentage,
    required double duration,
  }) {
    Color color;
    String svgSrc;
    switch (type) {
      case 0:
        color = Color(0xFF3F51B5);
        svgSrc = 'assets/icons/jobs/dron_flat.svg';
        break;
      case 1:
        color = Color(0xFF3F51B5);
        svgSrc = 'assets/icons/jobs/information_flat.svg';
        break;
      case 2:
        color = Color(0xFF00BCD4);
        svgSrc = 'assets/icons/jobs/irrigation_flat.svg';
        break;
      case 3:
        color = Color(0xFF795548);
        svgSrc = 'assets/icons/jobs/cow_flat.svg';
        break;
      case 4:
        color = Color(0xFF4CAF50);
        svgSrc = 'assets/icons/jobs/measure_flat.svg';
        break;
      case 5:
        color = Color(0xFFFF9800);
        svgSrc = 'assets/icons/jobs/pig_flat.svg';
        break;
      default:
        throw Exception('$type is not a valid value for JobModel');
    }
    return JobModel._(
      type,
      title,
      date,
      percentage,
      duration,
      svgSrc,
      color,
    );
  }

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        type: json['type'] as int,
        title: json['title'] as String,
        date: json['date'] as String,
        percentage: json['percentage'] as int,
        duration: json['duration'] as double,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'date': date,
        'percentage': percentage,
        'duration': duration,
      };

  JobModel copyWith({
    int? type,
    String? title,
    String? date,
    int? percentage,
    double? duration,
  }) {
    return JobModel(
      type: type ?? this.type,
      title: title ?? this.title,
      date: date ?? this.date,
      percentage: percentage ?? this.percentage,
      duration: duration ?? this.duration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobModel &&
        other.type == type &&
        other.title == title &&
        other.date == date &&
        other.percentage == percentage &&
        other.duration == duration;
  }

  @override
  int get hashCode =>
      type.hashCode ^
      title.hashCode ^
      date.hashCode ^
      percentage.hashCode ^
      duration.hashCode;

  @override
  String toString() {
    return 'JobModel(type: $type, title: $title, date: $date, percentage: $percentage, duration: $duration)';
  }
}

// List demoJobs = [
//   JobModel(
//     type: 0,
//     title: "Dron",
//     date: "2021-07-01 13:33:29.971Z",
//     duration: 0.7,
//     percentage: 35,
//   ),
//   JobModel(
//     type: 1,
//     title: "Growth information",
//     date: "2021-07-01 13:33:29.971Z",
//     duration: 0.7,
//     percentage: 35,
//   ),
//   JobModel(
//     type: 2,
//     title: "Irrigation",
//     date: "2021-07-01 13:33:29.971Z",
//     duration: 0.7,
//     percentage: 10,
//   ),
//   JobModel(
//     type: 3,
//     title: "Castel",
//     date: "2021-07-01 13:33:29.971Z",
//     duration: 0.7,
//     percentage: 78,
//   ),
//   JobModel(
//     type: 4,
//     title: "Measure",
//     date: "2021-07-01 13:33:29.971Z",
//     duration: 0.7,
//     percentage: 78,
//   ),
//   JobModel(
//     type: 5,
//     title: "Castel",
//     date: "2021-07-01 13:33:29.971Z",
//     duration: 0.7,
//     percentage: 78,
//   ),
// ];
