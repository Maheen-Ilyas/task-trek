import 'package:flutter/material.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class AuthNavigationText extends StatelessWidget {
  final String text;
  final String navText;
  final VoidCallback onTap;
  const AuthNavigationText({
    super.key,
    required this.text,
    required this.navText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGreyText,
          ),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: onTap,
          child: Text(
            navText,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
