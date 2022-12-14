import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rewards_app/screens/login/login_screen_bloc.dart';

import '../../shered_widgets/custom_textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _bloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/logo.png"),
            CustomTextField(
              controller: _bloc.emailController,
              hintText: AppLocalizations.of(context)!.email_lable,
              // errorMessage: "",
              lableText: AppLocalizations.of(context)!.email_hint,
              enabled: true,
              prefixIcon: const Icon(Icons.email),
            ),
const SizedBox(height: 20,),
               CustomTextField(
              controller: _bloc.passwordController,
              hintText: AppLocalizations.of(context)!.password_lable,
              // errorMessage: "",
              lableText: AppLocalizations.of(context)!.password_hint,
              enabled: true,
              prefixIcon: const Icon(Icons.password),
            )
          ],
        ),
      )),
    );
  }
}
