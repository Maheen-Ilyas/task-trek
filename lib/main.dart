import 'package:flutter/material.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/services/auth/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.firebase().initialize();
  runApp(const MyApp());
}
