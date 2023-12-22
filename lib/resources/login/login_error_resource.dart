class LoginErrorResources {
  String message;
  Map<String, List<String>> errors;

  LoginErrorResources({required this.message, required this.errors});

  factory LoginErrorResources.fromJson(Map<String, dynamic> json) {
    return LoginErrorResources(
      message: json['message'] ?? '',
      errors: (json['errors'] as Map<String, dynamic>?)
              ?.map((key, value) => MapEntry(key, (value as List<dynamic>).cast<String>())) ??
          {},
    );
  }

  @override
  String toString() {
    return 'LoginValidationResult{message: $message, errors: $errors}';
  }
}