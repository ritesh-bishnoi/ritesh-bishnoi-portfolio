class ContactModel {
  final String name;
  final String email;
  final String message;

  const ContactModel({
    required this.name,
    required this.email,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'message': message,
    };
  }
}