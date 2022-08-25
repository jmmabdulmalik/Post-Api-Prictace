import 'package:flutter/material.dart';

class StaticTextField {
  static Widget textField({
    required String title,
    required Icon icon,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        hintText: title,
        prefixIcon: icon,
      ),
    );
  }
}
