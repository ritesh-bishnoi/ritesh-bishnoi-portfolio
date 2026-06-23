import '../../core/di/injection.dart';

import 'data/datasources/contact_datasource.dart';
import 'data/repositories/contact_repository_impl.dart';

import 'domain/repositories/contact_repository.dart';
import 'domain/usecases/submit_contact.dart';

import 'presentation/bloc/contact_bloc.dart';

Future<void> initContact() async {
  // Data Source

  sl.registerLazySingleton<ContactRemoteDataSource>(
    () => ContactRemoteDataSourceImpl(
      sl(),
    ),
  );

  // Repository

  sl.registerLazySingleton<ContactRepository>(
    () => ContactRepositoryImpl(
      sl(),
    ),
  );

  // Use Case

  sl.registerLazySingleton(
    () => SubmitContact(
      sl(),
    ),
  );

  // Bloc

  sl.registerFactory(
    () => ContactBloc(
      sl(),
    ),
  );
}