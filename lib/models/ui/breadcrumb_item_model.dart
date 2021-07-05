import 'dart:convert';

import 'package:flutter/material.dart';

BreadcrumbItemModel breadcrumbItemModelFromJson(String str) =>
    BreadcrumbItemModel.fromJson(json.decode(str));

String breadcrumbItemModelToJson(BreadcrumbItemModel data) =>
    json.encode(data.toJson());

class BreadcrumbItemModel {
  BreadcrumbItemModel({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  factory BreadcrumbItemModel.fromJson(Map<String, dynamic> json) =>
      BreadcrumbItemModel(
        title: json["title"],
        onTap: json["onTap"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "onTap": onTap,
      };
}
