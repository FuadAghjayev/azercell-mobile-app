import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String labelText;
  final String hintText;
  final Color borderColor;
  final String prefixText;
  final FocusNode focusNode;
  final List<TextInputFormatter> inputFormatter;


  const CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    required this.labelText,
    required this.focusNode,
     this.hintText = "",
    this.borderColor = Colors.deepPurple,
    this.prefixText = '',
    required this.inputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          inputFormatters:inputFormatter,
          style: const TextStyle(
            fontSize: 18,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            prefixText: prefixText,
            prefixStyle: const TextStyle(
              fontSize: 18
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color:  Colors.deepPurple
                      ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
