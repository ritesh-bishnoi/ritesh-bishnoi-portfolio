import 'package:dio/dio.dart';
import 'package:frontend_flutter/core/network/dio_client.dart';
import 'package:frontend_flutter/features/contact/contact_injection.dart';
import 'package:frontend_flutter/features/projects/projects_injection.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network Layer

  sl.registerLazySingleton<DioClient>(
    () => DioClient(),
  );

  sl.registerLazySingleton<Dio>(
    () => sl<DioClient>().dio,
  );

  // Features

  await initProjects();
  await initContact();
}
