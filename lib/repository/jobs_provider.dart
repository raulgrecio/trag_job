import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:trag_work/features/job/models/models.dart';

abstract class JobsProvider {
  String apikey;
  String url;
  String? language;

  JobsProvider({
    required this.apikey,
    required this.url,
    this.language = 'es-ES',
  });

  Future<List<JobModel>> fetchJobs();
}

class JobsApiProvider extends JobsProvider {
  final String apikey;
  final String url;
  final String? language;

  JobsApiProvider({
    required this.apikey,
    required this.url,
    this.language,
  }) : super(apikey: apikey, url: url, language: language);

  Future<List<JobModel>> _processResponse(Uri uri) async {
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final jobs = new JobsModel.fromJson(decodedData['results']);

    return jobs.items!;
  }

  Future<List<JobModel>> fetchJobs() async {
    final uri = Uri.https(url, 'jobs/', {
      'api_key': apikey,
      'language': language,
    });

    return await _processResponse(uri);
  }
}

class JobsFakeProvider extends JobsProvider {
  final String apikey;
  final String url;
  final String? language;

  List<JobModel> _demoJobs = [
    JobModel(
      type: 0,
      title: "Dron",
      date: "2021-07-01 13:33:29.971Z",
      duration: 0.7,
      percentage: 35,
    ),
    JobModel(
      type: 1,
      title: "Growth information",
      date: "2021-07-01 13:33:29.971Z",
      duration: 0.7,
      percentage: 35,
    ),
    JobModel(
      type: 2,
      title: "Irrigation",
      date: "2021-07-01 13:33:29.971Z",
      duration: 0.7,
      percentage: 10,
    ),
    JobModel(
      type: 3,
      title: "Castel",
      date: "2021-07-01 13:33:29.971Z",
      duration: 0.7,
      percentage: 78,
    ),
    JobModel(
      type: 4,
      title: "Measure",
      date: "2021-07-01 13:33:29.971Z",
      duration: 0.7,
      percentage: 78,
    ),
    JobModel(
      type: 5,
      title: "Castel",
      date: "2021-07-01 13:33:29.971Z",
      duration: 0.7,
      percentage: 78,
    ),
  ];

  JobsFakeProvider({
    required this.apikey,
    required this.url,
    this.language,
  }) : super(apikey: apikey, url: url, language: language);

  Future<List<JobModel>> fetchJobs() async {
    return new Future.delayed(Duration(milliseconds: 150), () => _demoJobs);
  }
}
