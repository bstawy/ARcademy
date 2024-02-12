String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ("You must enter your email");
  }

  var regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  if (!regex.hasMatch(value)) {
    return 'Invalid email address';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'You must enter your password';
  }

  var regex = RegExp(
    r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$",
  );

  if (!regex.hasMatch(value)) {
    return 'Must contains A-Z, a-z, @-#-&.. , 1-9';
  }

  return null;
}
