class CouponQrErrorResources {
  String message;
  Map<String, List<String>> errors;

  CouponQrErrorResources({required this.message, required this.errors});

  factory CouponQrErrorResources.fromJson(Map<String, dynamic> json) {
    return CouponQrErrorResources(
      message: json['message'] ?? '',
      errors: (json['errors'] as Map<String, dynamic>?)
              ?.map((key, value) => MapEntry(key, (value as List<dynamic>).cast<String>())) ??
          {},
    );
  }

  @override
  String toString() {
    return 'CouponValidationResult{message: $message, errors: $errors}';
  }
}