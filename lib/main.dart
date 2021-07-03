import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'blocs/navigation_drawer/navigation_drawer_bloc.dart';
import 'views/screens/main/main_screen.dart';
import 'views/theme/theme.dart';

void main() async {
  await initializeDateFormatting("en_US", null);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext _) => new NavigationDrawerBloc()),
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
