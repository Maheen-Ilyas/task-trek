import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.poppins().fontFamily,
        color: AppColors.mediumGreyText,
      ),
      cursorColor: AppColors.lightGreyText,
      obscureText: widget.obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return "This field cannot be empty.";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: AppColors.mediumGreyText,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.lightGreyText,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.darkGreyText,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.mediumGreyText,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
