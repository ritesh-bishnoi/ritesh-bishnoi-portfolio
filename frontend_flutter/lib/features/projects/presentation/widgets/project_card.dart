import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend_flutter/core/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/project_entity.dart';


class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectBanner extends StatelessWidget {
  final Project project;

  const _ProjectBanner(this.project);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: project.id,
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: Image.network(
          project.fullImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final screen = Responsive.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()
          ..translate(
            0.0,
            _hovered ? -8.0 : 0.0,
          ),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 250),
          scale: _hovered ? 1.015 : 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 12,
                sigmaY: 12,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Colors.white.withOpacity(.15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(.10),
                      Colors.white.withOpacity(.05),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: _hovered ? 40 : 20,
                      spreadRadius: 0,
                      offset: const Offset(0, 12),
                      color: Colors.black.withOpacity(.12),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    _ProjectBanner(project),

                    Padding(
                      padding:
                          const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  project.title,
                                  style:
                                      Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontSize: screen.titleFontSize,
                                            fontWeight:
                                                FontWeight
                                                    .bold,
                                          ),
                                ),
                              ),

                              if (project.featured)
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration:
                                      BoxDecoration(
                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                                30),
                                    color: Colors.amber,
                                  ),
                                  child: const Text(
                                    'FEATURED',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(
                              height: 14),

                          Text(
                            project.description,
                            maxLines: 3,
                            overflow:
                                TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.6,
                              color: Colors
                                  .grey.shade700,
                            ),
                          ),

                          const SizedBox(
                              height: 18),

                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: project
                                .techStack
                                .map(
                                  (tech) =>
                                      Container(
                                    padding:
                                        const EdgeInsets.symmetric(
                                      horizontal:
                                          12,
                                      vertical:
                                          8,
                                    ),
                                    decoration:
                                        BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(
                                              30),
                                      color: const Color.fromARGB(255, 60, 44, 44)
                                          .withOpacity(
                                              .08),
                                    ),
                                    child: Text(
                                      tech,
                                      style:
                                          const TextStyle(
                                        fontSize:
                                            12,
                                        fontWeight:
                                            FontWeight
                                                .w600,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),

                          const SizedBox(
                              height: 22),

                          Row(
                            children: [
                              Expanded(
                                child:
                                    OutlinedButton.icon(
                                  onPressed: () =>
                                      _launch(
                                        project
                                            .githubUrl,
                                      ),
                                  icon: const Icon(
                                    Icons.code,
                                  ),
                                  label:
                                      const Text(
                                    'GitHub',
                                  ),
                                ),
                              ),

                              const SizedBox(
                                  width: 12),

                              Expanded(
                                child:
                                    FilledButton.icon(
                                  onPressed: () =>
                                      _launch(
                                        project
                                            .liveUrl,
                                      ),
                                  icon: const Icon(
                                    Icons.launch,
                                  ),
                                  label:
                                      const Text(
                                    'Live Demo',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}