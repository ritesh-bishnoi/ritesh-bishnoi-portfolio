import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend_flutter/features/projects/domain/entities/project_entity.dart';
import 'package:frontend_flutter/features/projects/domain/usecases/project_usecase.dart';


part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjects getProjects;

  ProjectBloc(this.getProjects) : super(ProjectInitial()) {
    // ✅ Register event handler
    on<FetchProjects>((event, emit) async {
      print("FetchProjects triggered");
      
      emit(ProjectLoading());

      try {
        final projects = await getProjects();
        emit(ProjectLoaded(projects));
      } catch (e) {
        emit(ProjectError('Failed to load projects'));
      }
    });
  }
}