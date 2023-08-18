import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simpsons_character_viewer/infrastructure/environment/environment.dart';
import 'package:simpsons_character_viewer/init_app.dart';
import 'package:simpsons_character_viewer/ui/home/ui/home_screen.dart';

import 'infrastructure/repository/data_repository.dart';
import 'ui/home/bloc/home_bloc.dart';

void internalMain() {
  initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => DataRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            lazy: false,
            create: (context) =>
                HomeBloc(context.read<DataRepository>())..add(FetchData()),
          ),
        ],
        child: const AppPage(),
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (ctx) {
        return MaterialApp(
          title: Environment.instance.config.appName,
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          home: const HomeScreen(),
        );
      },
    );
  }
}
