import 'package:frontend_flutter/features/projects/domain/entities/project_entity.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();
}