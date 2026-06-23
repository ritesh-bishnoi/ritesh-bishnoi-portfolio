import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Project extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> techStack;
  final String githubUrl;
  final String liveUrl;
  final String imageUrl;
  final bool featured;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.techStack,
    required this.githubUrl,
    required this.liveUrl,
    required this.imageUrl,
    this.featured = false,
  });

    String get fullImageUrl {
    return '${dotenv.env['API_BASE_URL']}$imageUrl';
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    techStack,
    githubUrl,
    liveUrl,
    imageUrl,
    featured
  ];
}
