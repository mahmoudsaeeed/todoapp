import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.readOnly = false,
    this.decoration,
    this.onTap,
    this.suffix,
  }) : assert(
          (hintText == null || decoration == null),
          'You can either provide hintText or decoration, not both.',
        ),
        assert(
          (suffix == null || decoration == null),
          'You can either provide suffix or decoration, not both.',
        );
    
  final TextEditingController controller;
  final String? hintText;
  final bool readOnly;
  final Widget? suffix;
  final InputDecoration? decoration;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            suffix: suffix,
          ),
      onTap: onTap,
    );
  }
}
