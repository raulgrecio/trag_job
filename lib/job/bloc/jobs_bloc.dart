import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:trag_work/job/models/models.dart';
import 'package:trag_work/services/jobs_repository.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobRepository jobRepository;

  JobsBloc({required this.jobRepository}) : super(JobsLoading());

  @override
  Stream<JobsState> mapEventToState(
    JobsEvent event,
  ) async* {
    if (event is JobsStarted) {
      yield* _mapJobsStartedToState();
    }
  }

  Stream<JobsState> _mapJobsStartedToState() async* {
    yield JobsLoading();
    try {
      final jobs = await jobRepository.fetchJobs();
      yield JobsLoaded(JobsModel(items: jobs));
    } catch (_) {
      yield JobsError();
    }
  }
}
