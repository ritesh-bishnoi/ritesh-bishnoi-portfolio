import 'package:frontend_flutter/features/projects/domain/repositories/project_repository.dart';

import '../../domain/entities/project_entity.dart';
import '../datasources/project_datasource.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Project>> getProjects() async {
    return await remoteDataSource.getProjects();
  }
}