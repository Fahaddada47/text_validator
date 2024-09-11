library text_validator;

class TextValidators {
  // RequiredValidator - Ensures the value is not null, empty, nor whitespace
  static String? required(String? value, {String message = 'This field is required'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  // EmailValidator - Ensures the value is a validly formatted email address
  static String? email(String? value, {String message = 'Invalid email address'}) {
    final RegExp emailRegEx = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    if (value == null || !emailRegEx.hasMatch(value)) {
      return message;
    }
    return null;
  }

  // CurrencyValidator - Ensures the value is a valid currency format
  static String? currency(String? value, {String message = 'Invalid currency format'}) {
    final RegExp currencyRegEx = RegExp(r"^\d+(\.\d{1,2})?$");
    if (value == null || !currencyRegEx.hasMatch(value)) {
      return message;
    }
    return null;
  }

  // PhoneNumberValidator - Ensures the value is a validly formatted phone number
  static String? phoneNumber(String? value, {String message = 'Invalid phone number'}) {
    final RegExp phoneRegEx = RegExp(r'^\+?[0-9]{10,15}$');
    if (value == null || !phoneRegEx.hasMatch(value)) {
      return message;
    }
    return null;
  }

  // NumberValidator - Ensures the value is a valid number
  static String? number(String? value, {String message = 'Invalid number'}) {
    if (value == null || double.tryParse(value) == null) {
      return message;
    }
    return null;
  }

  // MaxLengthValidator - Ensures the value contains no more than a set number of characters
  static String? maxLength(String? value, int maxLength, {String message = 'Exceeds max length'}) {
    if (value != null && value.length > maxLength) {
      return '$message ($maxLength characters max)';
    }
    return null;
  }

  // MinLengthValidator - Ensures the value contains no fewer than a set number of characters
  static String? minLength(String? value, int minLength, {String message = 'Below min length'}) {
    if (value != null && value.length < minLength) {
      return '$message ($minLength characters min)';
    }
    return null;
  }

  // MaxNumberValidator - Ensures the value is no larger than a given number
  static String? maxNumber(String? value, num maxNumber, {String message = 'Exceeds max number'}) {
    if (value != null && num.tryParse(value)! > maxNumber) {
      return '$message ($maxNumber max)';
    }
    return null;
  }

  // MinNumberValidator - Ensures the value is no smaller than a given number
  static String? minNumber(String? value, num minNumber, {String message = 'Below min number'}) {
    if (value != null && num.tryParse(value)! < minNumber) {
      return '$message ($minNumber min)';
    }
    return null;
  }
}
