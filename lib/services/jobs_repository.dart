import 'package:trag_work/models/job_model.dart';
import 'package:trag_work/services/jobs_provider.dart';

class JobRepository {
  JobsProvider _jobsProvider = JobsFakeProvider(
    apikey: '1865f43a0549ca50d341dd9ab8b29f49',
    url: 'api.tragjobs.org',
  );

  Future<List<JobModel>> fetchJobs() => _jobsProvider.fetchJobs();

  /** sample */
  // Future<List<JobModel>> fetchJobsByName(String name) =>
  //     _jobsProvider.fetchJobsByName(name);
}
