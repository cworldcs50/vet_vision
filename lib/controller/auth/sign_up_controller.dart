import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/caching_keys_constants.dart';
import '../../core/network/request_status.dart';
import '../../core/services/app_service.dart';
import '../../data/models/user_model.dart';
import '../../core/routes/app_routes_name.dart';
import '../../data/datasource/static/cache_user.dart';
import '../../core/classes/base_request_controller.dart';
import '../../data/datasource/remote/auth/sign_in_with_google.dart';
import '../../data/datasource/remote/auth/sign_in_with_facebook.dart';
import '../../data/datasource/remote/auth/sign_up_with_email_and_password.dart';

mixin class Validators {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  final SharedPreferences _sharedPrefs = Get.find<AppServices>().appSharedPrefs;

  String? passwordValidator(String? password) {
    if (password == null) {
      return "mandatory";
    }
    if (password.isEmpty) {
      return "Enter Your password";
    }
    if (!RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(password)) {
      return "Password must be at least 8 characters \nlong and include an uppercase letter, a lowercase letter, \na number, and a special character.";
    }
    return null;
  }

  String? emailValidator(String? email) {
    if (email == null) {
      return "mandatory";
    }
    if (email.isEmpty) {
      return "Enter Your Email";
    }
    if (!GetUtils.isEmail(email)) {
      return "Invalid Email";
    }
    return null;
  }

  String? fullNameValidator(String? fullName) {
    if (fullName == null) {
      return "mandatory";
    }

    if (fullName.isEmpty) {
      return "Enter Your Full Name";
    }

    if (fullName.length < 3) {
      return "Name length should be greater than or equal 3";
    }

    return null;
  }

  String? confirmedPasswordValidator(String? confirmedPassword) {
    if (confirmedPassword == null) {
      return "mandatory";
    }

    if (confirmedPassword.isEmpty) {
      return "confirm your password";
    }

    if (passwordController.text != confirmedPassword) {
      return "Password mismatch";
    }

    return null;
  }
}

class SignUpController extends BaseRequestController with Validators {
  bool checkBoxValue = false;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>(
    debugLabel: "signUpFormKey",
  );
  bool showPassword = true, showConfirmedPassword = true;
  IconData showPasswordSuffixIcon = Icons.visibility_outlined;
  IconData showConfirmedPasswordSuffixIcon = Icons.visibility_outlined;

  void visiblePassword() {
    showPassword = !showPassword;

    if (showPassword) {
      showPasswordSuffixIcon = Icons.visibility_outlined;
    } else {
      showPasswordSuffixIcon = Icons.visibility_off_outlined;
    }

    update();
  }

  void visibleConfirmedPassword() {
    showConfirmedPassword = !showConfirmedPassword;

    if (showConfirmedPassword) {
      showConfirmedPasswordSuffixIcon = Icons.visibility_outlined;
    } else {
      showConfirmedPasswordSuffixIcon = Icons.visibility_off_outlined;
    }

    update();
  }

  void onChanged(bool? checkBoxValue) {
    this.checkBoxValue = checkBoxValue!;
    update();
  }

  Future<void> signUpWithGoogle() async {
    if (!await checkOnline()) return;

    setStatus(RequestStatus.loading);

    final result = await SignInWithGoogle()();

    result.fold(
      (l) {
        setStatus(RequestStatus.failure);
        Get.snackbar(
          l.title,
          l.message,
          titleText: Text(l.title, style: const TextStyle(color: Colors.white)),
          messageText: Text(
            l.message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
      },
      (r) async {
        setStatus(RequestStatus.success);

        final user = UserModel(
          id: r.user!.id,
          email: emailController.text.trim(),
          fullName: fullNameController.text.trim(),
          password: confirmedPasswordController.text.trim(),
        );

        final isCached = await CacheUser()(user);

        isCached.fold(
          (l) {
            setStatus(RequestStatus.failure);
            Get.showSnackbar(
              GetSnackBar(
                title: "Error!",
                message: l,
                backgroundColor: Colors.red,
              ),
            );
          },
          (_) async {
            await Get.offAllNamed(AppRoutesName.rSuccessAuth);
          },
        );
      },
    );
  }

  Future<void> signUpWithFacebook() async {
    if (!await checkOnline()) return;

    setStatus(RequestStatus.loading);

    final result = await SignInWithFacebook()();

    result.fold(
      (l) {
        setStatus(RequestStatus.failure);
        Get.showSnackbar(
          GetSnackBar(
            title: l.title,
            message: l.message,
            backgroundColor: Colors.red,
          ),
        );
      },
      (r) async {
        setStatus(RequestStatus.success);

        final user = UserModel(
          id: r.user!.id,
          email: emailController.text.trim(),
          fullName: fullNameController.text.trim(),
          password: confirmedPasswordController.text.trim(),
        );

        final isCached = await CacheUser()(user);

        isCached.fold(
          (l) {
            setStatus(RequestStatus.failure);
            Get.showSnackbar(
              GetSnackBar(
                title: "Error!",
                message: l,
                backgroundColor: Colors.red,
              ),
            );
          },
          (_) async {
            await Get.offAllNamed(AppRoutesName.rSuccessAuth);
            await _sharedPrefs.setBool(
              CachingKeysConstants.kIsAuthedUser,
              true,
            );
          },
        );
      },
    );
  }

  Future<void> signUp() async {
    if (!await checkOnline()) return;

    if (signUpFormKey.currentState!.validate()) {
      if (checkBoxValue) {
        setStatus(RequestStatus.loading);

        final result = await SignUpWithEmailAndPassword()(
          email: emailController.text.trim(),
          password: confirmedPasswordController.text.trim(),
          data: {"full_name": fullNameController.text.trim()},
        );

        result.fold(
          (l) {
            setStatus(RequestStatus.failure);
            Get.showSnackbar(
              GetSnackBar(
                title: l.title,
                message: l.message,
                backgroundColor: Colors.red,
              ),
            );
          },
          (r) async {
            setStatus(RequestStatus.success);
            try {
              final isCached = await CacheUser()(
                UserModel(
                  id: r.session == null ? r.user!.aud : r.session!.user.id,
                  email: emailController.text.trim(),
                  fullName: fullNameController.text.trim(),
                  password: confirmedPasswordController.text.trim(),
                ),
              );
              isCached.fold((l) {
                setStatus(RequestStatus.failure);
                Get.showSnackbar(
                  GetSnackBar(
                    title: "Error!",
                    message: l,
                    backgroundColor: Colors.red,
                  ),
                );
              }, (_) async => await Get.toNamed(AppRoutesName.rSuccessAuth));
            } catch (e) {
              setStatus(RequestStatus.failure);
              Get.showSnackbar(
                GetSnackBar(
                  title: "Error!",
                  message: e.toString(),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        );
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: "Warning!",
            message: "You must agree to the terms and conditions.",
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void retry() => setStatus(RequestStatus.noData);

  Future<void> returnToSignIn() async =>
      await Get.offNamed(AppRoutesName.rSignIn);

  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    fullNameController.dispose();
    confirmedPasswordController.dispose();
    super.onClose();
  }
}
