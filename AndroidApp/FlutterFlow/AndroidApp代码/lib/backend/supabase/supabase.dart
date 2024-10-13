import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://qxkddqiixegfvuccrfet.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF4a2RkcWlpeGVnZnZ1Y2NyZmV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTYzMzAwMDgsImV4cCI6MjAxMTkwNjAwOH0.KDKt-sG7X1YiUgOOQD6i8Vbg_2Nfahz2jMbntoBfw9M';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
