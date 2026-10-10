import 'package:ddcs_app/app/ddcs_app.dart';
import 'package:ddcs_app/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try { await dotenv.load(fileName: '.env'); } catch (_) { /* Allow app shell to start before configuration. */ }
  final config = AppConfig.fromEnvironment();
  if (config.supabaseReady) await Supabase.initialize(url: config.supabaseUrl!, anonKey: config.supabaseAnonKey!);
  runApp(DDCSApp(config: config));
}
