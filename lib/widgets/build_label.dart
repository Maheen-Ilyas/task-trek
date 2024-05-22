import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class BuildLabel extends StatelessWidget {
  final String title;
  const BuildLabel({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
        letterSpacing: 1.5,
        color: AppColors.mediumGreyText,
      ),
    );
  }
}
