import '../repositories/contact_repository.dart';

class SubmitContact {
  final ContactRepository repository;

  SubmitContact(this.repository);

  Future<void> call({
    required String name,
    required String email,
    required String message,
  }) {
    return repository.submitContact(
      name: name,
      email: email,
      message: message,
    );
  }
}