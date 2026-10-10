import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  const AppConfig({required this.supabaseUrl, required this.supabaseAnonKey, required this.googleMapsApiKey});
  final String? supabaseUrl;
  final String? supabaseAnonKey;
  final String? googleMapsApiKey;
  bool get supabaseReady => (supabaseUrl?.startsWith('https://') ?? false) && (supabaseAnonKey?.isNotEmpty ?? false) && !supabaseAnonKey!.startsWith('YOUR_');
  factory AppConfig.fromEnvironment() => AppConfig(supabaseUrl: dotenv.env['SUPABASE_URL'], supabaseAnonKey: dotenv.env['SUPABASE_ANON_KEY'], googleMapsApiKey: dotenv.env['GOOGLE_MAPS_API_KEY']);
}
