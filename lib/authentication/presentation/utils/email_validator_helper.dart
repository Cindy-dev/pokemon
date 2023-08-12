 emailValidator(String? val) {
  final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!regex.hasMatch(val!)) {
    return "The email address is incomplete.";
  } else {
    return null;
  }
}