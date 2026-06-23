import '../../domain/repositories/contact_repository.dart';
import '../datasources/contact_datasource.dart';
import '../models/contact_model.dart';

class ContactRepositoryImpl
    implements ContactRepository {
  final ContactRemoteDataSource remoteDataSource;

  ContactRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  Future<void> submitContact({
    required String name,
    required String email,
    required String message,
  }) {
    return remoteDataSource.submitContact(
      ContactModel(
        name: name,
        email: email,
        message: message,
      ),
    );
  }
}