import 'package:flutter_test/flutter_test.dart';
import 'package:text_validator/text_validator.dart';

void main() {
  group('TextValidators', () {
    test('required validator', () {
      expect(TextValidators.required(''), 'This field is required');
      expect(TextValidators.required(null), 'This field is required');
      expect(TextValidators.required('Test'), null);
      expect(TextValidators.required('', customMessage: 'Custom error'), 'Custom error');
    });

    test('noNumbers validator', () {
      expect(TextValidators.noNumbers('123'), 'Username cannot contain numbers');
      expect(TextValidators.noNumbers('username'), null);
      expect(TextValidators.noNumbers(null), 'Username cannot contain numbers');
    });

    test('email validator', () {
      expect(TextValidators.email('invalid'), 'Invalid email address');
      expect(TextValidators.email('test@example.com'), null);
      expect(TextValidators.email(null), 'Invalid email address');
    });

    test('currency validator', () {
      expect(TextValidators.currency('123.45'), null);
      expect(TextValidators.currency('123.456'), 'Invalid currency format');
      expect(TextValidators.currency(null), 'Invalid currency format');
    });

    test('phoneNumber validator', () {
      expect(TextValidators.phoneNumber('+1234567890'), null);
      expect(TextValidators.phoneNumber('123'), 'Invalid phone number');
      expect(TextValidators.phoneNumber(null), 'Invalid phone number');
    });

    test('number validator', () {
      expect(TextValidators.number('123.45'), null);
      expect(TextValidators.number('invalid'), 'Invalid number');
      expect(TextValidators.number(null), 'Invalid number');
    });

    test('maxLength validator', () {
      expect(TextValidators.maxLength('toolong', 5), 'Exceeds max length (5 characters max)');
      expect(TextValidators.maxLength('short', 5), null);
      expect(TextValidators.maxLength(null, 5), null);
    });

    test('minLength validator', () {
      expect(TextValidators.minLength('short', 10), 'Below min length (10 characters min)');
      expect(TextValidators.minLength('longenough', 5), null);
      expect(TextValidators.minLength(null, 5), null);
    });

    test('maxNumber validator', () {
      expect(TextValidators.maxNumber('100', 50), 'Exceeds max number (50 max)');
      expect(TextValidators.maxNumber('40', 50), null);
      expect(TextValidators.maxNumber('invalid', 50), null);
      expect(TextValidators.maxNumber(null, 50), null);
    });

    test('minNumber validator', () {
      expect(TextValidators.minNumber('10', 20), 'Below min number (20 min)');
      expect(TextValidators.minNumber('30', 20), null);
      expect(TextValidators.minNumber('invalid', 20), null);
      expect(TextValidators.minNumber(null, 20), null);
    });
  });
}