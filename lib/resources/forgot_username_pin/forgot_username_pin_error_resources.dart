class ForgotUsernamePinErrorResources {
  String message;
  Map<String, List<String>> errors;

  ForgotUsernamePinErrorResources(
      {required this.message, required this.errors});

  factory ForgotUsernamePinErrorResources.fromJson(Map<String, dynamic> json) {
    return ForgotUsernamePinErrorResources(
      message: json['message'] ?? '',
      errors: (json['errors'] as Map<String, dynamic>?)?.map((key, value) =>
              MapEntry(key, (value as List<dynamic>).cast<String>())) ??
          {},
    );
  }

  @override
  String toString() {
    return 'ForgotUsernamePinValidationResult{message: $message, errors: $errors}';
  }
}
