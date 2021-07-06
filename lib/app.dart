import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/navigation_drawer/navigation_drawer_bloc.dart';
import 'job/job.dart';
import 'services/jobs_repository.dart';
import 'views/screens/main/main_screen.dart';
import 'views/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.jobRepository}) : super(key: key);

  final JobRepository jobRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext _) => new NavigationDrawerBloc()),
        BlocProvider(
          create: (_) => JobsBloc(
            jobRepository: jobRepository,
          )..add(JobsStarted()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TragWork',
        theme: coreThemeData,
        home: MainScreen(),
      ),
    );
  }
}
