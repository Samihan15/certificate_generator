import 'package:flutter/material.dart';

Widget textfield(
    {required TextEditingController controller,
    required String label,
    String? hint,
    TextInputType? type,
    Icon? icon}) {
  return TextField(
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
      prefixIcon: icon,
      labelText: label,
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.orange,
        ),
      ),
    ),
  );
}
