import 'package:aqary_test/features/asynchronous_generator_with_transformer/bloc/counter_bloc.dart';
import 'package:aqary_test/features/sticky_header/logic/bloc/todo_bloc.dart';
import 'package:aqary_test/features/sticky_header/repository/i_todo_repository.dart';
import 'package:aqary_test/shared/router/app_router.dart';
import 'package:aqary_test/shared/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(serviceLocator<ITodoRepository>()),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
