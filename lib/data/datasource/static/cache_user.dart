import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import '../../models/user_model.dart';
import '../../../core/services/app_service.dart';
import '../../../core/constants/caching_keys_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheUser {
  Future<Either<String, bool>> call(UserModel user) async {
    final SharedPreferences sharedPrefs =
        Get.find<AppServices>().appSharedPrefs;

    final result =
        await sharedPrefs.setString(
          CachingKeysConstants.kUserEmail,
          user.email,
        ) &&
        await sharedPrefs.setString(
          CachingKeysConstants.kUserPassword,
          user.password,
        ) &&
        await sharedPrefs.setString(
          CachingKeysConstants.kUserFullName,
          user.fullName,
        ) &&
        await sharedPrefs.setString(CachingKeysConstants.kUserId, user.id);

    if (result) { 
      return const Right(true);
    } else { 
      return const Left("user not saved!");
    }
  }
}