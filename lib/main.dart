import 'package:flutter/material.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/services/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  await AuthService.firebase().initialize();
  runApp(MyApp(isFirstTime: isFirstTime));
}
