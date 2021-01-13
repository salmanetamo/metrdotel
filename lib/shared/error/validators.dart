String validateEmptyValue(String value, String field) {
  if (value.isEmpty) {
    return 'Please enter $field';
  }
  return null;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Please enter valid email';
  else
    return null;
}

String validateMinSize(String value, String field, int min) {
  if (value.trim().length < min) {
    return 'The $field must contain at least $min characters';
  }
  return null;
}
