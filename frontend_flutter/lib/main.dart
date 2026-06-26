import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/di/injection.dart';

import 'core/theme/app_theme.dart';
import 'features/home/presentation/pages/home_page.dart';

import 'features/projects/presentation/bloc/bloc/project_bloc.dart';
import 'features/contact/presentation/bloc/contact_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ProjectBloc>()),
          BlocProvider(create: (_) => sl<ContactBloc>()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
