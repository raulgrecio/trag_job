import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/job/job.dart';
import 'features/side_menu/side_menu.dart';
import 'repository/jobs_repository.dart';
import 'theme/theme.dart';

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
