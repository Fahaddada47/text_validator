import 'package:flutter_test/flutter_test.dart';
import 'package:text_validator/text_validator.dart';

void main() {
  group('RequiredValidator', () {
    test('should return error when value is null', () {
      expect(TextValidators.required(null), 'This field is required');
    });

    test('should return error when value is empty', () {
      expect(TextValidators.required(''), 'This field is required');
    });

    test('should return null when value is not empty', () {
      expect(TextValidators.required('John Doe'), null);
    });
  });

  group('EmailValidator', () {
    test('should return error when email is invalid', () {
      expect(TextValidators.email('invalid-email'), 'Invalid email address');
    });

    test('should return null when email is valid', () {
      expect(TextValidators.email('test@example.com'), null);
    });
  });

  group('PhoneNumberValidator', () {
    test('should return error when phone number is invalid', () {
      expect(TextValidators.phoneNumber('123abc'), 'Invalid phone number');
    });

    test('should return null when phone number is valid', () {
      expect(TextValidators.phoneNumber('+1234567890'), null);
    });
  });

  group('CurrencyValidator', () {
    test('should return error when currency format is invalid', () {
      expect(TextValidators.currency('invalid-currency'), 'Invalid currency format');
    });

    test('should return null when currency format is valid', () {
      expect(TextValidators.currency('123.45'), null);
    });
  });

  group('MaxLengthValidator', () {
    test('should return error when value exceeds max length', () {
      expect(TextValidators.maxLength('Too long text', 5), 'Exceeds max length (5 characters max)');
    });

    test('should return null when value is within max length', () {
      expect(TextValidators.maxLength('Text', 10), null);
    });
  });

  group('MinLengthValidator', () {
    test('should return error when value is below min length', () {
      expect(TextValidators.minLength('Short', 10), 'Below min length (10 characters min)');
    });

    test('should return null when value is within min length', () {
      expect(TextValidators.minLength('Long enough text', 5), null);
    });
  });

  group('MaxNumberValidator', () {
    test('should return error when number exceeds max', () {
      expect(TextValidators.maxNumber('10', 5), 'Exceeds max number (5 max)');
    });

    test('should return null when number is within max', () {
      expect(TextValidators.maxNumber('3', 5), null);
    });
  });

  group('MinNumberValidator', () {
    test('should return error when number is below min', () {
      expect(TextValidators.minNumber('3', 5), 'Below min number (5 min)');
    });

    test('should return null when number is above min', () {
      expect(TextValidators.minNumber('7', 5), null);
    });
  });
  group('NoNumbersValidator', () {
    test('should return error when value contains numbers', () {
      expect(TextValidators.noNumbers('user123'), 'Username cannot contain numbers');
    });

    test('should return null when value does not contain numbers', () {
      expect(TextValidators.noNumbers('username'), null);
    });
  });


}
