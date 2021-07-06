part of 'jobs_bloc.dart';

@immutable
abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class JobsStarted extends JobsEvent {
  @override
  List<Object> get props => [];
}
