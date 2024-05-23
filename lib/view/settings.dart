import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/services/auth/auth_service.dart';
import 'package:to_do/utils/theme/app_colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          "Settings",
          style: TextStyle(
            color: AppColors.lightGreyText,
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.lightGreyText,
            size: 28.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Appearence",
                style: TextStyle(
                  color: AppColors.lightGreyText,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    SettingItemTile(
                      onTap: () {},
                      title: "Light Mode",
                      titleColor: AppColors.lightGreyText,
                      subTitle:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                      leading: const Icon(
                        Icons.light_mode_outlined,
                        color: AppColors.lightGreyText,
                        size: 28.0,
                      ),
                      trailing: const Icon(
                        Icons.toggle_off_outlined,
                        color: AppColors.lightGreyText,
                        size: 38.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                "Account",
                style: TextStyle(
                  color: AppColors.lightGreyText,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    SettingItemTile(
                      onTap: () {},
                      title: "Delete Account",
                      titleColor: AppColors.primaryColor,
                      subTitle:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                      leading: const Icon(
                        Icons.delete_outlined,
                        color: AppColors.lightGreyText,
                        size: 28.0,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: AppColors.lightGreyText,
                        size: 28.0,
                      ),
                    ),
                    Divider(
                      color: AppColors.mediumGreyText.withOpacity(0.5),
                    ),
                    SettingItemTile(
                      onTap: () {},
                      title: "Log out",
                      titleColor: AppColors.lightGreyText,
                      subTitle:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                      leading: const Icon(
                        Icons.logout_outlined,
                        color: AppColors.lightGreyText,
                        size: 28.0,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: AppColors.lightGreyText,
                        size: 28.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItemTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color titleColor;
  final String subTitle;
  final Icon leading;
  final Icon trailing;
  const SettingItemTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.titleColor,
    required this.subTitle,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
            color: AppColors.mediumGreyText.withOpacity(0.6),
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          ),
        ),
        leading: leading,
        trailing: trailing,
      ),
    );
  }
}
