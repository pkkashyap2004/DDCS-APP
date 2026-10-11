import 'package:ddcs_app/app/ddcs_app.dart';
import 'package:ddcs_app/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // The app shell must still open when .env is missing or misconfigured.
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // Supabase can remain disabled until configuration is supplied.
  }

  final config = AppConfig.fromEnvironment();

  // Invalid or unavailable Supabase configuration should not crash launch.
  if (config.supabaseReady) {
    try {
      await Supabase.initialize(
        url: config.supabaseUrl!,
        anonKey: config.supabaseAnonKey!,
      );
    } catch (_) {
      // Continue into the app shell; data features can be configured later.
    }
  }

  runApp(DDCSApp(config: config));
}
