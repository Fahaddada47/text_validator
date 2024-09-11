import 'package:flutter/material.dart';
import 'package:text_validator/text_validator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Text Validator Example')),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Name field with required and max length validators
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                return TextValidators.required(value, customMessage: 'Name is required') ??
                    TextValidators.maxLength(value, 50, customMessage: 'Name cannot be longer than 50 characters');
              },
            ),
            // Email field with email validator
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                return TextValidators.email(value, customMessage: 'Please enter a valid email');
              },
            ),
            // Currency field with currency validator
            TextFormField(
              decoration: const InputDecoration(labelText: 'Amount'),
              validator: (value) {
                return TextValidators.currency(value, customMessage: 'Invalid amount format');
              },
            ),
            // Phone number field with phone number validator
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                return TextValidators.phoneNumber(value, customMessage: 'Please enter a valid phone number');
              },
            ),
            // Submit button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
