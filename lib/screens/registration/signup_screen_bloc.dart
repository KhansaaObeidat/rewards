import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/shared_methods.dart';

enum signUpStatusEnum { faild, success, none, inProgress }

class SignUpBloc {
    ValueNotifier<bool> showPasswordLetter = ValueNotifier<bool>(true);
        ValueNotifier<bool> showrePasswordLetter = ValueNotifier<bool>(true);


  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  ValueNotifier<bool> fieldValidation = ValueNotifier<bool>(false);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ValueNotifier<signUpStatusEnum> signUpStatus =
      ValueNotifier<signUpStatusEnum>(signUpStatusEnum.none);
  void validateFields() {
    signUpStatus.value = signUpStatusEnum.none;

    if (emailController.text.isEmpty) {
      fieldValidation.value = false;
    } else if (passwordController.text.isEmpty) {
      fieldValidation.value = false;
    } else if (repasswordController.text.isEmpty) {
      fieldValidation.value = false;
    } else if (fullNameController.text.isEmpty) {
      fieldValidation.value = false;
    } else if (SharedMethods.checkEmailSantax(emailController.text)) {
      if (passwordController.text == repasswordController.text) {
        if (passwordController.text.length > 5) {
          fieldValidation.value = true;
        } else {
          fieldValidation.value = false;
        }
      } else {
        fieldValidation.value = false;
      }
    } else {
      fieldValidation.value = false;
    }
  }

  Future<bool> signUp() async {
    signUpStatus.value = signUpStatusEnum.inProgress;
    final User? user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      if (user != null) {
        signUpStatus.value = signUpStatusEnum.success;
        print(user.email);
        print(user.uid);
        print(user.tenantId);
        return true;
        // _userEmail = user.email;
      } else {
        signUpStatus.value = signUpStatusEnum.faild;
        print("object");
        return false;
      }
    } catch (error) {
      print("__--" + error.toString());
      signUpStatus.value = signUpStatusEnum.faild;
      return false;
    }
  }
}
