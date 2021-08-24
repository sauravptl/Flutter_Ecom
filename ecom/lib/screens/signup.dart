import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/authentication.dart';

import '/screens/productDetails.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNUmberController = TextEditingController();
  final _passController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isLogin = false;

  final Map<String, String> _authLoginData = {
    'email': '',
    'password': '',
  };

  final Map<String, String> _authSignUpData = {
    'username': '',
    'email': '',
    'number': '',
    'password': '',
  };

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    if (!_isLogin) {
      final id = _authLoginData['email']! + _authLoginData['password']!;
      final valid = Provider.of<AuthenticationData>(context, listen: false)
          .login(id, false);
      valid
          ? Navigator.of(context)
              .pushReplacementNamed(ProductScreen.routeName, arguments: valid)
          : ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cant not login check details'),
              ),
            );
    } else {
      final valid =
          Provider.of<AuthenticationData>(context, listen: false).signUp(
        _authSignUpData['username']!,
        _authSignUpData['email']!,
        _authSignUpData['number']!,
        _authSignUpData['password']!,
      );
      valid
          ? Navigator.of(context)
              .pushReplacementNamed(ProductScreen.routeName, arguments: valid)
          : ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Can not  SignUp Check Detail'),
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(10),
          color: Colors.blue[200],
          elevation: 5,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (_isLogin)
                      TextFormField(
                        key: const ValueKey('username'),
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Enter minimum 4 characters';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _authSignUpData['userName'] = newValue!;
                        },
                      ),
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Enter Valid Email Address';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _authLoginData['email'] = newValue!;
                        _authSignUpData['email'] = newValue;
                      },
                    ),
                    if (_isLogin)
                      TextFormField(
                        key: const ValueKey('number'),
                        controller: _mobileNUmberController,
                        decoration:
                            const InputDecoration(labelText: 'Mobile Number'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.length != 10) {
                            return 'Enter Valid Number';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _authSignUpData['number'] = newValue!;
                        },
                      ),
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Password should be of 8 numeric digit';
                        }
                      },
                      onSaved: (newValue) {
                        _authLoginData['password'] = newValue!;
                        _authSignUpData['password'] = newValue;
                      },
                    ),
                    if (_isLogin)
                      TextFormField(
                        key: const ValueKey('conformpassword'),
                        decoration: const InputDecoration(
                            labelText: 'Confirm Password'),
                        validator: (value) {
                          if (_passController.text != value) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                    ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      child: Text(_isLogin ? 'Signup' : 'Login'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child:
                          Text(_isLogin ? 'Have Account ?' : 'Create Account'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                            ProductScreen.routeName,
                            arguments: false);
                      },
                      child: const Text('Skip'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
