import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend_flutter/features/contact/domain/usecases/submit_contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';


class ContactBloc
    extends Bloc<ContactEvent, ContactState> {
  final SubmitContact submitContact;

  ContactBloc(
    this.submitContact,
  ) : super(ContactInitial()) {
    on<SubmitContactEvent>(
      _submitContact,
    );
  }

  Future<void> _submitContact(
    SubmitContactEvent event,
    Emitter<ContactState> emit,
  ) async {
    emit(ContactLoading());

    try {
      await submitContact(
        name: event.name,
        email: event.email,
        message: event.message,
      );

      emit(ContactSuccess());
    } catch (_) {
      emit(
        ContactError(
          'Failed to send message',
        ),
      );
    }
  }
}
