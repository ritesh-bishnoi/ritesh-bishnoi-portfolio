import 'package:dio/dio.dart';

import '../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjects();
}

class ProjectRemoteDataSourceImpl
    implements ProjectRemoteDataSource {
  final Dio dio;

  ProjectRemoteDataSourceImpl(
    this.dio,
  );

  @override
  Future<List<ProjectModel>> getProjects() async {
    try {
      final response = await dio.get(
        '/projects',
      );

      final List<dynamic> data =
          response.data['data'];

      return data
          .map(
            (e) => ProjectModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ??
            'Failed to fetch projects',
      );
    } catch (e) {
      throw Exception(
        'Failed to fetch projects',
      );
    }
  }
}