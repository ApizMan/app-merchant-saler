class ProfileErrorResources {
  String message;
  Map<String, List<String>> errors;

  ProfileErrorResources({required this.message, required this.errors});

  factory ProfileErrorResources.fromJson(Map<String, dynamic> json) {
    return ProfileErrorResources(
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