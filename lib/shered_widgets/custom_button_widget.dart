import 'package:flutter/material.dart';
import 'package:rewards_app/shered_widgets/custom_textfield_widget.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPress;
     final bool enable;

  const CustomButtonWidget({required this.title, required this.onPress,this.enable=true, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: enable?onPress:null,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
              child: Text(
            title,
            style: CustomTextStyle().medium(size: 20),
          )),
        ),
      ),
    );
  }
}
