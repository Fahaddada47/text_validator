import 'package:flutter/material.dart';
import 'package:text_validator/text_validator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Text Validator Example')),
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
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                return TextValidators.required(value) ??
                    TextValidators.maxLength(value, 50);
              },
            ),
            // Email field with email validator
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: TextValidators.email,
            ),
            // Currency field with currency validator
            TextFormField(
              decoration: InputDecoration(labelText: 'Amount'),
              validator: TextValidators.currency,
            ),
            // Phone number field with phone number validator
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone Number'),
              validator: TextValidators.phoneNumber,
            ),
            // Submit button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
