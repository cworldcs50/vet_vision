import 'dart:async';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../network/error_model.dart';
import '../functions/is_online.dart';
import '../../data/models/supabase_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SupabaseService {
  const SupabaseService._();
  factory SupabaseService() => _instance;

  static const SupabaseService _instance = SupabaseService._();

  SupabaseClient get supabase => Supabase.instance.client;

  Future<Either<ErrorModel, Supabase>> initSupabase({
    required SupabaseModel supabaseModel,
  }) async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(message: "You are currently offline!", title: "Error!"),
        );
      } else {
        return Right(
          await Supabase.initialize(
            url: supabaseModel.supabaseUrl,
            anonKey: supabaseModel.supabaseAnonKey,
          ),
        );
      }
    } on AuthApiException catch (e) {
      return Left(
        ErrorModel(message: "Status code: ${e.statusCode}", title: e.message),
      );
    }
  }

  Future<Either<ErrorModel, AuthResponse>> authenticateWithGoogle() async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(title: "Error!", message: "You are currently offline!"),
        );
      } else {
        const webClientId =
            '182177822675-2l5jchue90m0v1q4mb9eik3cb1uhmcl5.apps.googleusercontent.com';
        const iosClientId =
            '182177822675-oe8udvkg85fpnv7q1k2a5m41vhp9v2u0.apps.googleusercontent.com';

        final GoogleSignIn signIn = GoogleSignIn.instance;

        unawaited(
          signIn.initialize(clientId: iosClientId, serverClientId: webClientId),
        );

        final googleAccount = await signIn.authenticate();
        final googleAuthorization = await googleAccount.authorizationClient
            .authorizationForScopes(['email', 'profile']);
        final googleAuthentication = googleAccount.authentication;
        final idToken = googleAuthentication.idToken;
        final accessToken = googleAuthorization!.accessToken;

        if (idToken == null) {
          throw 'No ID Token found.';
        }

        return Right(
          await supabase.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: idToken,
            accessToken: accessToken,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      return Left(ErrorModel(message: e.toString(), title: "Error!"));
    }
  }

  Future<Either<ErrorModel, AuthResponse>> authenticateWithFacebook() async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(message: "You are currently offline!", title: "Error!"),
        );
      } else {
        final LoginResult result = await FacebookAuth.instance.login(
          permissions: ['public_profile', 'email'],
        );
        if (result.status == LoginStatus.success) {
          final accessToken = result.accessToken!.tokenString;
          return Right(
            await supabase.auth.signInWithIdToken(
              provider: OAuthProvider.facebook,
              idToken: accessToken,
            ),
          );
        } else {
          return Left(
            ErrorModel(
              title: "Facebook login failed",
              message: "${result.status}",
            ),
          );
        }
      }
    } catch (e) {
      return Left(
        ErrorModel(
          title: "Facebook authentication error",
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<ErrorModel, AuthResponse>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    Map<String, dynamic>? data,
  }) async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(title: "Error!", message: "You are currently offline!"),
        );
      } else {
        return Right(
          await supabase.auth.signUp(
            email: email,
            password: password,
            data: data,
          ),
        );
      }
    } on AuthApiException catch (e) {
      return Left(
        ErrorModel(message: "Status code: ${e.statusCode}", title: e.message),
      );
    }
  }

  Future<Either<ErrorModel, void>> forgetPassword(String email) async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(title: "Error!", message: "You are currently offline!"),
        );
      } else {
        return Right(await supabase.auth.resetPasswordForEmail(email));
      }
    } on AuthApiException catch (e) {
      return Left(
        ErrorModel(message: "Status code: ${e.statusCode}", title: e.message),
      );
    }
  }

  Future<Either<ErrorModel, AuthResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(title: "Error!", message: "You are currently offline!"),
        );
      } else {
        return Right(
          await supabase.auth.signInWithPassword(
            email: email,
            password: password,
          ),
        );
      }
    } on AuthApiException catch (e) {
      return Left(
        ErrorModel(message: "Status code: ${e.statusCode}", title: e.message),
      );
    }
  }

  Future<Either<ErrorModel, void>> signUpWithEmailOtp(String email) async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(title: "Error!", message: "You are currently offline!"),
        );
      } else {
        return Right(await supabase.auth.signInWithOtp(email: email));
      }
    } on AuthApiException catch (e) {
      return Left(
        ErrorModel(message: "Status code: ${e.statusCode}", title: e.message),
      );
    }
  }

  Future<Either<ErrorModel, AuthResponse>> verifyOtp(
    String email,
    String userEnteredOtp,
  ) async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(title: "Error!", message: "You are currently offline!"),
        );
      } else {
        return Right(
          await supabase.auth.verifyOTP(
            email: email,
            type: OtpType.email,
            token: userEnteredOtp,
          ),
        );
      }
    } on AuthApiException catch (e) {
      return Left(
        ErrorModel(message: "Status code: ${e.statusCode}", title: e.message),
      );
    }
  }

  Future<Either<ErrorModel, void>> signOut() async {
    try {
      if (!await isOnline()) {
        return const Left(
          ErrorModel(title: "Error!", message: "You are currently offline!"),
        );
      } else {
        return Right(await supabase.auth.signOut());
      }
    } catch (e) {
      return const Left(
        ErrorModel(message: "Failed to sign out", title: "Error!"),
      );
    }
  }
}
