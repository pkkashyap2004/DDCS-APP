import 'package:ddcs_app/core/config/app_config.dart';
import 'package:ddcs_app/views/home/home_page.dart';
import 'package:flutter/material.dart';

class DDCSApp extends StatelessWidget {
  const DDCSApp({super.key, required this.config});
  final AppConfig config;
  @override Widget build(BuildContext context) => MaterialApp(title: 'DDCS | Deepak Digital Computer Studio', debugShowCheckedModeBanner: false, theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1769E0)), scaffoldBackgroundColor: const Color(0xFFF7F9FC)), home: HomePage(config: config));
}
