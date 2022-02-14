import 'package:eaid/home/loading.dart';
import 'package:eaid/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType { login, register }

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String error = '';
  FormType _form = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  // Swap in between our two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Sign In'),
            ),
            body: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  _buildTextFields(),
                  _buildButtons(),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          );
  }

  Widget _buildTextFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) => value!.isEmpty ? 'Enter an email' : null,
            onChanged: (value) => setState(() {
              _email = value;
            }),
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            validator: (value) => value!.isEmpty || value.length < 6
                ? 'Enter a valid password'
                : null,
            onChanged: (value) => setState(() {
              _password = value;
            }),
            decoration:
                InputDecoration(labelText: 'Password(6 charachters minimum)'),
            obscureText: true,
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('Login'),
              onPressed: _loginPressed,
            ),
            TextButton(
              child: Text('Don\'t have an account? Tap here to register.'),
              onPressed: _formChange,
            ),
            TextButton(
              child: Text('Forgot Password?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            TextButton(
              child: Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  Future<void> _loginPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      dynamic result = await _auth.signIn(_email, _password);
      if (result == null) {
        print('Error signing in');
        setState(() {
          error = 'could not sign in';
          loading = false;
        });
      } else {
        print('Signed in');
        print(result.uid);
      }
    }
  }

  Future<void> _createAccountPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      dynamic result = await _auth.signUp(_email, _password);

      if (result == null) {
        setState(() {
          error = 'could not create an account';
          loading = false;
        });
      } else {
        print(
            'The user wants to create an account with $_email and $_password');
        print(result.uid);
      }
    }
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
  }
}
