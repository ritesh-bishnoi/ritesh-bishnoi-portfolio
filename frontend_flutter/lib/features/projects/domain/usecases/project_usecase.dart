import '../entities/project_entity.dart';
import '../repositories/project_repository.dart';

class GetProjects {
  final ProjectRepository repository;

  GetProjects(this.repository);

  Future<List<Project>> call() {
    return repository.getProjects();
  }
}