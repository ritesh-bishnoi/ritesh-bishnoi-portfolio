part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class SubmitContactEvent
    extends ContactEvent {
  final String name;
  final String email;
  final String message;

  const SubmitContactEvent({
    required this.name,
    required this.email,
    required this.message,
  });
}