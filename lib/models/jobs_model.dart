import 'package:flutter/foundation.dart';

import 'job_model.dart';

@immutable
class JobsModel {
  final List<JobModel>? items;

  const JobsModel({this.items});

  @override
  String toString() => 'JobsModel(items: $items)';

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        items: (json['results'] as List<dynamic>?)
            ?.map((e) => JobModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'results': items?.map((e) => e.toJson()).toList(),
      };

  JobsModel copyWith({
    List<JobModel>? items,
  }) {
    return JobsModel(
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobsModel && listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}
