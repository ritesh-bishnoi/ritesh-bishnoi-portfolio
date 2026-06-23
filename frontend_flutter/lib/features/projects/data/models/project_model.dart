import 'package:frontend_flutter/features/projects/domain/entities/project_entity.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.techStack,
    required super.githubUrl,
    required super.liveUrl,
    required super.imageUrl,
    super.featured
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    if (json['_id'] == null) {
      throw Exception('Project id is missing');
    }

    if (json['title'] == null) {
      throw Exception('Project title is missing');
    }

    return ProjectModel(
      id: json['_id'].toString(),
      title: json['title'].toString(),
      description: json['description']?.toString() ?? '',
      techStack: List<String>.from(json['techStack'] ?? []),
      githubUrl: json['githubUrl']?.toString() ?? '',
      liveUrl: json['liveUrl']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      featured: json['featured'] ?? false,
    );
  }
}
