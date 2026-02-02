import 'package:dartz/dartz.dart';
import '../../../../core/network/error_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/services/supabase_service.dart';

class SignInWithGoogle {
  Future<Either<ErrorModel, AuthResponse>> call() async =>
      await SupabaseService().authenticateWithGoogle();
}
