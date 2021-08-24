import 'package:flutter/material.dart';

class Authentication {
  final String id;
  final String userName;
  final String email;
  final String mobileNumber;
  final String password;

  Authentication({
    required this.id,
    required this.userName,
    required this.email,
    required this.mobileNumber,
    required this.password,
  });
}

class AuthenticationData with ChangeNotifier {
  final List<Authentication> _authenticationDataList = [
    Authentication(
      id: 'test@test.com12345678',
      userName: 'tester',
      email: 'test@test.com',
      mobileNumber: '9999999999',
      password: '12345678',
    )
  ];

  List<Authentication> get authenticationDataList {
    return [..._authenticationDataList];
  }

  Authentication findById(String id) {
    return authenticationDataList.firstWhere((element) => element.id == id);
  }

  bool login(
    String id,
    bool isValid,
  ) {
    try {
      final userAuthData = findById(id);
      if (userAuthData.runtimeType == Authentication) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  bool signUp(
    String userName,
    String email,
    String mobileNumber,
    String password,
  ) {
    _authenticationDataList.add(Authentication(
        id: email + password,
        userName: userName,
        email: email,
        mobileNumber: mobileNumber,
        password: password));

    return login(email + password, false);
  }
}
