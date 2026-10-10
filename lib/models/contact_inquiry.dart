class ContactInquiry {
  const ContactInquiry({required this.name, required this.email, required this.message, this.phone = ''});
  final String name, email, phone, message;
  Map<String, dynamic> toInsertMap() => {'name': name.trim(), 'email': email.trim(), 'phone': phone.trim().isEmpty ? null : phone.trim(), 'message': message.trim()};
}
