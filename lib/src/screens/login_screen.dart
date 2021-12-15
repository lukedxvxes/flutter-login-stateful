import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            emailField(),
            passwordField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        icon: Icon(Icons.person),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email address';
        }
        return null;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Enter your password',
        icon: Icon(Icons.password_sharp),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (_formKey.currentState!.validate()) {
            // Process data.
            print(_formKey);
          }
        },
        child: const Text('Submit'),
      ),
    );
  }
}
