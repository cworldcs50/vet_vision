import 'package:dartz/dartz.dart';
import '../../../../core/network/error_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/services/supabase_service.dart';

class SignInWithEmailAndPassword {
  Future<Either<ErrorModel, AuthResponse>> call({
    required String email,
    required String password,
  }) async {
    final result = await SupabaseService().signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result;
  }
}
