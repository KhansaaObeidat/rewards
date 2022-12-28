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
    return Padding(
      padding: const EdgeInsets.only(left:16.0,right: 16),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
            icon: prefixIcon,
            errorText: errorMessage,
            hintText: hintText,
            labelText: lableText,
            labelStyle: TextStyle(
                color: controller.text.isNotEmpty
                    ? Color.fromARGB(255, 255, 255, 255)
                    : const Color(0xff384048),
                fontSize: 20),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color:  Color.fromARGB(255, 235, 238, 240))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color:  Color.fromARGB(255, 235, 238, 240))),
            border:const OutlineInputBorder(
                borderSide: BorderSide(
                    color:  Color.fromARGB(255, 235, 238, 240))),
                        filled: true,
                        fillColor: enabled? Color.fromARGB(255, 253, 221, 221):const Color.fromARGB(255, 112, 104, 104),
                        
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
      ),
    );
  }
}
