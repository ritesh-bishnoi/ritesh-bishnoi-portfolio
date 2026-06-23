abstract class ContactRepository {
  Future<void> submitContact({
    required String name,
    required String email,
    required String message,
  });
}