import 'package:flutter/material.dart';
import 'package:rewards_app/screens/login/login_screen.dart';
import 'package:rewards_app/screens/main_container/main_container.dart';
import 'package:rewards_app/screens/registration/signup_screen_bloc.dart';
import 'package:rewards_app/shered_widgets/custom_button_widget.dart';
import 'package:rewards_app/shered_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _bloc = SignUpBloc();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(title: const Text("Sign Up")),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Registration!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _bloc.fullNameController,
                  hintText: AppLocalizations.of(context)!.fullName_hint,
                  lableText: AppLocalizations.of(context)!.fullName_lable,
                  prefixIcon: const Icon(Icons.email),
                  onChange: (value) => _bloc.validateFields(),
                  keyboaredType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _bloc.emailController,
                  hintText: AppLocalizations.of(context)!.email_hint,
                  lableText: AppLocalizations.of(context)!.email_lable,
                  prefixIcon: const Icon(Icons.email),
                  onChange: (value) => _bloc.validateFields(),
                  keyboaredType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _bloc.passwordController,
                  hintText: AppLocalizations.of(context)!.password_hint,
                  lableText: AppLocalizations.of(context)!.password_lable,
                  prefixIcon: const Icon(Icons.password),
                  obscureText: true,
                  keyboaredType: TextInputType.visiblePassword,
                  onChange: (value) => _bloc.validateFields(),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _bloc.repasswordController,
                  hintText: AppLocalizations.of(context)!.repassword_hint,
                  lableText: AppLocalizations.of(context)!.repassword_lable,
                  prefixIcon: const Icon(Icons.password),
                  obscureText: true,
                  keyboaredType: TextInputType.visiblePassword,
                  onChange: (value) => _bloc.validateFields(),
                ),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder<bool>(
                    valueListenable: _bloc.fieldValidation,
                    builder: (context, snapshot, child) {
                      return CustomButtonWidget(
                        title: "Register",
                        enable: snapshot,
                        onPress: () async {
                          await _bloc.signUp().then((value) {
                            if (value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (ctx) {
                                return  LoginScreen();
                              }), (route) => false);
                            }
                          });
                         
                        },
                      );
                    }),
                ValueListenableBuilder<signUpStatusEnum>(
                    valueListenable: _bloc.signUpStatus,
                    builder: (context, snapshot, child) {
                      if (snapshot == signUpStatusEnum.faild) {
                        return const Text("Email or password invalid");
                      } else if (snapshot == signUpStatusEnum.inProgress) {
                        return const CircularProgressIndicator();
                      } else {
                        return Container();
                      }
                    })
              ],
            ),
          )),
    );
  }
}
