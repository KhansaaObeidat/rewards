import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/shared_methods.dart';

enum LoginStatusEnum {
  faild,
  success,
  none, inProgress
}

class LoginBloc {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> fieldValidation = ValueNotifier<bool>(false);
  ValueNotifier<LoginStatusEnum> loginStatus =
      ValueNotifier<LoginStatusEnum>(LoginStatusEnum.none);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void validateFields() {
    loginStatus.value = LoginStatusEnum.none;
    if (emailController.text.isEmpty) {
      fieldValidation.value = false;
    } else if (passwordController.text.isEmpty) {
      fieldValidation.value = false;
    } else if (SharedMethods.checkEmailSantax(emailController.text)) {
      fieldValidation.value = true;
    } else {
      fieldValidation.value = false;
    }
  }

  

  Future<bool> signInWithEmailAndPassword() async {
    loginStatus.value=LoginStatusEnum.inProgress;
    final User? user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      if (user != null) {
        loginStatus.value = LoginStatusEnum.success;
        print(user.email);
        print(user.uid);
        print(user.tenantId);
        return true;
        // _userEmail = user.email;
      } else {
        loginStatus.value = LoginStatusEnum.faild;
        print("object");
        return false;
      }
    } catch (error) {
      print("__--" + error.toString());
      loginStatus.value = LoginStatusEnum.faild;
      return false;
    }
  }
}
