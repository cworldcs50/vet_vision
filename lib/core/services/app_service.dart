import 'package:get/get.dart';
import 'supabase_service.dart';
import '../constants/secret_constants.dart';
import '../../data/models/supabase_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late final SharedPreferences appSharedPrefs;

  Future<AppServices> init() async {
    appSharedPrefs = await SharedPreferences.getInstance();
    return this;
  }
}

Future<void> initServices() async {
  await Get.putAsync(() => AppServices().init());
  await SupabaseService().initSupabase(
    supabaseModel: const SupabaseModel(
      supabaseUrl: SecretConstants.kSupabaseUrl,
      supabaseAnonKey: SecretConstants.kSupabaseAnonKey,
    ),
  );
}
