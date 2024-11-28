bool isValidData(String regexString, String? data) {
  return RegExp(regexString).hasMatch(data.toString());
}