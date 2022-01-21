class ValidationService {
  static String? notEmpty(String? val, [String? field]) {
    if (val != null && val.isEmpty) {
      return "${field ?? "field"} shuld not be empty";
    }
  }
}
