import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required this.labelText,
    required this.validator,
    required this.controller,
    super.key,
  });

  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(32, 33, 36, 0.24),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(32, 33, 36, 0.54),
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          errorStyle: TextStyle(height: 0.6, color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Color.fromRGBO(32, 33, 36, 0.54)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        keyboardType: TextInputType.text,
        validator: widget.validator,
        // (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Будь-ласка введіть повідомлення';
        //   }
        //   return null;
        // },
      ),
    );
  }
}
