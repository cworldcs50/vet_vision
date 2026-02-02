import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/network/request_status.dart';
import '../../core/routes/app_routes_name.dart';
import '../../core/classes/base_request_controller.dart';
import '../../data/datasource/remote/auth/sign_in_with_google.dart';
import '../../data/datasource/remote/auth/sign_in_with_facebook.dart';
import '../../data/datasource/remote/auth/sign_in_with_email_and_password.dart';

class SignInController extends BaseRequestController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>(
    debugLabel: "signInFormKey",
  );
  IconData showPasswordSuffixIcon = Icons.visibility_outlined;
  bool showPassword = true;

  void visiblePassword() {
    showPassword = !showPassword;

    if (showPassword) {
      showPasswordSuffixIcon = Icons.visibility_outlined;
    } else {
      showPasswordSuffixIcon = Icons.visibility_off_outlined;
    }

    update();
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

  Future<void> signInWithGoogle() async {
    final result = await SignInWithGoogle()();

    result.fold(
      (l) => Get.showSnackbar(
        GetSnackBar(
          title: l.title,
          message: l.message,
          backgroundColor: Colors.red,
        ),
      ),
      (r) async => await Get.offAllNamed(AppRoutesName.rHome),
    );
  }

  Future<void> signInWithFacebook() async {
    final result = await SignInWithFacebook()();

    result.fold(
      (l) => Get.showSnackbar(
        GetSnackBar(
          title: l.title,
          message: l.message,
          backgroundColor: Colors.red,
        ),
      ),
      (r) async => await Get.offAllNamed(AppRoutesName.rHome),
    );
  }

  Future<void> signIn() async {
    if (!await checkOnline()) return;

    if (signInFormKey.currentState!.validate()) {
      setStatus(RequestStatus.loading);

      final result = await SignInWithEmailAndPassword()(
        email: emailController.text,
        password: passwordController.text,
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
          await Get.offAllNamed(AppRoutesName.rHome);
        },
      );
    }
  }

  void retry() => setStatus(RequestStatus.noData);

  /*Future<void> signIn() async {
    if (signInFormKey.currentState!.validate()) {
      final result = await SignInWithEmailAndPassword()(
        email: emailController.text,
        password: passwordController.text,
      );

      result.fold(
        (l) => Get.showSnackbar(
          GetSnackBar(
            title: l.title,
            message: l.message,
            backgroundColor: Colors.red,
          ),
        ),
        (r) async {
          await Get.offAllNamed(AppRoutesName.rHome);
        },
      );
    }
  }*/

  Future<void> goToSignUp() async => await Get.offNamed(AppRoutesName.rSignUp);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
