import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorMessage;
  final String lableText;
  final bool obscureText;
  final bool enabled;
  final TextInputType? keyboaredType;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String text)? onChange;

  const CustomTextField(
      {required this.controller,
      required this.hintText,
      this.errorMessage,
      required this.lableText,
      this.obscureText = false,
      this.enabled = true,
      this.keyboaredType,
      this.prefixIcon,
      this.inputFormatters,
      this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
          icon: prefixIcon,
          errorText: errorMessage,
          hintText: hintText,
          labelText: lableText,
          // labelStyle: CustomTextStyle().medium(
          //     color: controller.text.isNotEmpty
          //         ? const Color(0xffe04e4d)
          //         : const Color(0xff384048),
          //     size: 14),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: controller.text.isNotEmpty
                      ? const Color(0xffe04e4d)
                      : const Color(0xff384048))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: controller.text.isNotEmpty
                      ? const Color(0xffe04e4d)
                      : const Color(0xff384048))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: controller.text.isNotEmpty
                      ? const Color(0xffe04e4d)
                      : const Color(0xff384048))),
                      filled: true,
                      fillColor: enabled? const Color.fromARGB(255, 236, 20, 67):const Color.fromARGB(255, 112, 104, 104),
                      
                      ),
                      
      obscureText: obscureText,
      style: enabled
          ? const TextStyle(fontSize: 14, color: Colors.black)
          : const TextStyle(fontSize: 14, color: Colors.grey),
      inputFormatters: inputFormatters,
      onChanged: (text){
        if(onChange!=null){
          onChange!(text);
        }
      },
      keyboardType: keyboaredType,
      cursorColor: const Color(0xff100c31), 
    );
  }
}
