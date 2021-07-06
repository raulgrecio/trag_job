part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  const JobsLoaded(this.jobs);

  final JobsModel jobs;

  @override
  List<Object> get props => [jobs];
}

class JobsError extends JobsState {}
