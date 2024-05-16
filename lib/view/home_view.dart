import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/app/routes.dart';
import 'package:to_do/services/auth/auth_service.dart';
import 'package:to_do/utils/theme/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/widgets/task_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CollectionReference userName =
      FirebaseFirestore.instance.collection('userInfo');
  final String date = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  String name = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userName.doc(AuthService.firebase().uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: AppColors.primaryColor,
              ),
            ),
          );
        } else if (snapshot.data == null) {
          return Center(
            child: Text(
              'No user name.',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: AppColors.primaryColor,
              ),
            ),
          );
        }
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        name = data['name'];
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            actions: [
              IconButton(
                onPressed: () {},
                tooltip: "Settings",
                icon: const Icon(
                  Icons.settings_outlined,
                  size: 28.0,
                  color: AppColors.lightGreyText,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(addTaskRoute);
                },
                tooltip: "Add Task",
                icon: const Icon(
                  Icons.add,
                  size: 28.0,
                  color: AppColors.lightGreyText,
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date.toString(),
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      letterSpacing: 2.0,
                      color: AppColors.darkGreyText,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Welcome back $name,\nHere are your daily tasks.",
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineLarge?.fontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      color: AppColors.lightGreyText,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const TaskList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
