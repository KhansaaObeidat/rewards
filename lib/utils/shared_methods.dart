import 'package:flutter/material.dart';

class SharedMethods{
 static bool checkEmailSantax(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
  
//     List<Widget> buildLanguageButtons() {
//   return [
//     FlatButton(
//       child: Text('English'),
//       onPressed: () => _changeLanguage(const Locale('en')),
//     ),
//     FlatButton(
//       child: Text('Spanish'),
//       onPressed: () => _changeLanguage(const Locale('es')),
//     ),
//     // Add more buttons for additional languages here
//   ];

//   }
}