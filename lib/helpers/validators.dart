class InputValidator {
  static String? required(dynamic value) {
    if (value == null ||
        value == false ||
        ((value is Iterable || value is String || value is Map) &&
            value.length == 0)) {
      return "Please fill in this field";
    }
    return null;
  }

  static String? pin(String nric) {
    if (nric.length != 6) {
      return "Must 6 numeric characters";
    }
    return null;
  }
}