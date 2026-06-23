import '../../core/di/injection.dart';

import 'data/datasources/project_datasource.dart';
import 'data/repositories/project_repository_impl.dart';

import 'domain/repositories/project_repository.dart';
import 'domain/usecases/project_usecase.dart';

import 'presentation/bloc/bloc/project_bloc.dart';

Future<void> initProjects() async {
  // Data Source

  sl.registerLazySingleton<ProjectRemoteDataSource>(
    () => ProjectRemoteDataSourceImpl(
      sl(),
    ),
  );

  // Repository

  sl.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(
      sl(),
    ),
  );

  // Use Case

  sl.registerLazySingleton(
    () => GetProjects(
      sl(),
    ),
  );

  // Bloc

  sl.registerFactory(
    () => ProjectBloc(
      sl(),
    ),
  );
}