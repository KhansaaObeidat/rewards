import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rewards_app/screens/login/login_screen_bloc.dart';
import 'package:rewards_app/screens/main_container/main_container.dart';
import 'package:rewards_app/screens/registration/signup_screen.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

import '../../shered_widgets/custom_button_widget.dart';
import '../../shered_widgets/custom_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _bloc = LoginBloc();

  @override
  // void initState() {

  //   _buttonIsDisable = true;
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/logo.png",
              ),
              CustomTextField(
                controller: _bloc.emailController,
                hintText: AppLocalizations.of(context)!.email_lable,
                // errorMessage: "",
                lableText: AppLocalizations.of(context)!.email_hint,
                enabled: true,
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _bloc.passwordController,
                obscureText: true,
                hintText: AppLocalizations.of(context)!.password_lable,
                // errorMessage: "",
                lableText: AppLocalizations.of(context)!.password_hint,
                enabled: true,
                prefixIcon: const Icon(Icons.password),
                onChange: (value) => _bloc.validateFields(),
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: _bloc.fieldValidation,
                  builder: (context, snapshot, child) {
                    return CustomButtonWidget(
                      title: "Log in",
                      enable: snapshot,
                      onPress: () async {
                        await _bloc.signInWithEmailAndPassword().then((value) {
                          if (value) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (ctx) {
                              return  MainContainer();
                            }), (route) => false);
                          }
                        });
                      },
                    );
                  }),
              ValueListenableBuilder<LoginStatusEnum>(
                  valueListenable: _bloc.loginStatus,
                  // stream: null,
                  builder: (context, snapshot, child) {
                    if (snapshot == LoginStatusEnum.faild) {
                      return Text(
                        "Error in email or password",
                        style: CustomTextStyle()
                            .regular(color: Colors.red, size: 18),
                      );
                    } else if(snapshot==LoginStatusEnum.inProgress){
                      return const CircularProgressIndicator();
                    } else {
                      return Container();
                    }
                  }),

                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return  SignUpScreen();},));
                  }, child:  Text("Sign Up",style:CustomTextStyle().medium(color:Colors.blueAccent,size:18)),)
            ],
          ),
        ),
      )),
    );
  }
}
