import 'package:dio/dio.dart';

import '../models/contact_model.dart';

abstract class ContactRemoteDataSource {
  Future<void> submitContact(
    ContactModel contact,
  );
}

class ContactRemoteDataSourceImpl
    implements ContactRemoteDataSource {
  final Dio dio;

  ContactRemoteDataSourceImpl(
    this.dio,
  );

  @override
  Future<void> submitContact(
    ContactModel contact,
  ) async {
    try {
      final response = await dio.post(
        '/contact',
        data: contact.toJson(),
      );

      if (response.statusCode != 200 &&
          response.statusCode != 201) {
        throw Exception(
          'Failed to submit contact form',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message']?.toString() ??
            e.message ??
            'Failed to submit contact form',
      );
    } catch (_) {
      throw Exception(
        'Failed to submit contact form',
      );
    }
  }
}