import 'package:dartz/dartz.dart';
import '../../../../core/network/error_model.dart';
import '../../../../core/services/supabase_service.dart';

class ForgetPasswordData {
  Future<Either<ErrorModel, void>> call({required String email}) async {
    final result = await SupabaseService().forgetPassword(email);

    return result;
  }
}
