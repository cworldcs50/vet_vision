import 'package:dartz/dartz.dart';
import '../../../../core/network/error_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/services/supabase_service.dart';

class SignUpWithEmailAndPassword {
  Future<Either<ErrorModel, AuthResponse>> call({
    required String email,
    required String password,
    Map<String, dynamic>? data,
  }) async {
    final result = await SupabaseService().signUpWithEmailAndPassword(
      email: email,
      password: password,
      data: data,
    );

    return result;
  }
}
