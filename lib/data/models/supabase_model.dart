import 'package:equatable/equatable.dart';

class SupabaseModel extends Equatable {
  const SupabaseModel({
    required this.supabaseAnonKey,
    required this.supabaseUrl,
  });

  final String supabaseUrl, supabaseAnonKey;

  @override
  List<Object?> get props => [supabaseUrl, supabaseAnonKey];
}
