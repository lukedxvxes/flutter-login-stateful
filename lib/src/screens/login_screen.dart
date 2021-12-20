import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  submitData(email, password) {
    print(
        'here you can consume the email:$email and password:$password in an api or something');
  }

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
            Container(margin: const EdgeInsets.only(top: 15.0)),
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
      validator: validateEmail,
      onSaved: (value) {
        email = value.toString();
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
      validator: validatePassword,
      onSaved: (String? value) {
        password = value.toString();
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: const Text('Submit'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade600),
      ),
      onPressed: () {
        // Validate will return true if the form is valid, or false if
        // the form is invalid. Validation set in validator() on TextFormField
        if (_formKey.currentState!.validate()) {
          // Process data.
          _formKey.currentState!
              .save(); // triggers onSave function on TextFormField
          submitData(email, password);
          _formKey.currentState!.reset();
        }
      },
    );
  }
}
