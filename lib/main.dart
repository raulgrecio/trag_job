import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'services/jobs_repository.dart';

void main() async {
  await initializeDateFormatting("en_US", null);

  runApp(App(jobRepository: JobRepository()));
}
