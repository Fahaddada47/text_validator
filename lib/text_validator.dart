library text_validator;

class TextValidators {
  // RequiredValidator - Ensures the value is not null, empty, nor whitespace
  static String? required(String? value, {String? customMessage}) {
    String defaultMessage = 'This field is required';
    if (value == null || value.trim().isEmpty) {
      return customMessage ?? defaultMessage;
    }
    return null;
  }

  // NoNumbersValidator - Ensures the value does not contain numeric characters
  static String? noNumbers(String? value, {String? customMessage}) {
    final RegExp noNumbersRegEx = RegExp(r'^[^\d]+$');
    String defaultMessage = 'Username cannot contain numbers';
    if (value == null || !noNumbersRegEx.hasMatch(value)) {
      return customMessage ?? defaultMessage;
    }
    return null;
  }

  // EmailValidator - Ensures the value is a validly formatted email address
  static String? email(String? value, {String? customMessage}) {
    final RegExp emailRegEx = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    String defaultMessage = 'Invalid email address';
    if (value == null || !emailRegEx.hasMatch(value)) {
      return customMessage ?? defaultMessage;
    }
    return null;
  }

  // CurrencyValidator - Ensures the value is a valid currency format
  static String? currency(String? value, {String? customMessage}) {
    final RegExp currencyRegEx = RegExp(r"^\d+(\.\d{1,2})?$");
    String defaultMessage = 'Invalid currency format';
    if (value == null || !currencyRegEx.hasMatch(value)) {
      return customMessage ?? defaultMessage;
    }
    return null;
  }

  // PhoneNumberValidator - Ensures the value is a validly formatted phone number
  static String? phoneNumber(String? value, {String? customMessage}) {
    final RegExp phoneRegEx = RegExp(r'^\+?[0-9]{10,15}$');
    String defaultMessage = 'Invalid phone number';
    if (value == null || !phoneRegEx.hasMatch(value)) {
      return customMessage ?? defaultMessage;
    }
    return null;
  }

  // NumberValidator - Ensures the value is a valid number
  static String? number(String? value, {String? customMessage}) {
    String defaultMessage = 'Invalid number';
    if (value == null || double.tryParse(value) == null) {
      return customMessage ?? defaultMessage;
    }
    return null;
  }

  // MaxLengthValidator - Ensures the value contains no more than a set number of characters
  static String? maxLength(String? value, int maxLength, {String? customMessage}) {
    String defaultMessage = 'Exceeds max length';
    if (value != null && value.length > maxLength) {
      return customMessage ?? '$defaultMessage ($maxLength characters max)';
    }
    return null;
  }

  // MinLengthValidator - Ensures the value contains no fewer than a set number of characters
  static String? minLength(String? value, int minLength, {String? customMessage}) {
    String defaultMessage = 'Below min length';
    if (value != null && value.length < minLength) {
      return customMessage ?? '$defaultMessage ($minLength characters min)';
    }
    return null;
  }

  // MaxNumberValidator - Ensures the value is no larger than a given number
  static String? maxNumber(String? value, num maxNumber, {String? customMessage}) {
    String defaultMessage = 'Exceeds max number';
    if (value != null && num.tryParse(value)! > maxNumber) {
      return customMessage ?? '$defaultMessage ($maxNumber max)';
    }
    return null;
  }

  // MinNumberValidator - Ensures the value is no smaller than a given number
  static String? minNumber(String? value, num minNumber, {String? customMessage}) {
    String defaultMessage = 'Below min number';
    if (value != null && num.tryParse(value)! < minNumber) {
      return customMessage ?? '$defaultMessage ($minNumber min)';
    }
    return null;
  }
}
