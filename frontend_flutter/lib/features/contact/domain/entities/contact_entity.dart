import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String name;
  final String email;
  final String message;

  const Contact({
    required this.name,
    required this.email,
    required this.message,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        message,
      ];
}