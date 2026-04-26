import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/caching_keys_constants.dart';
import '../../core/network/request_status.dart';
import '../../core/routes/app_routes_name.dart';
import '../../core/classes/base_request_controller.dart';
import '../../core/services/app_service.dart';
// import '../../data/datasource/remote/auth/forget_password_data.dart';
import '../../data/datasource/remote/auth/sign_in_with_google.dart';
import '../../data/datasource/remote/auth/sign_in_with_facebook.dart';
import '../../data/datasource/remote/auth/sign_in_with_email_and_password.dart';
import '../../data/datasource/remote/auth/sign_up_with_email_and_password.dart';
import '../../data/datasource/static/cache_user.dart';
import '../../data/models/user_model.dart';
import '../../data/models/doctor_model.dart';

class AuthController extends BaseRequestController {
  bool isDoctor = false;
  RxBool isSignIn = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgetPasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  // Doctor Registration Step Controllers
  final PageController doctorRegistrationPageController = PageController();
  RxInt currentDoctorStep = 1.obs;

  // Step 1: Personal Information
  TextEditingController phoneController = TextEditingController();

  // Step 2: Professional Details
  TextEditingController specializationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  XFile? profileImage;
  final ImagePicker _picker = ImagePicker();

  // Step 3: Practice Details
  TextEditingController sessionCostController = TextEditingController();
  TextEditingController clinicAddressController = TextEditingController();
  RxBool isOnlineConsultation = false.obs;
  RxBool isInPersonConsultation = false.obs;
  RxBool termsAccepted = false.obs;

  final SharedPreferences _sharedPrefs = Get.find<AppServices>().appSharedPrefs;

  final GlobalKey<FormState> authFormKey = GlobalKey<FormState>(
    debugLabel: "authFormKey",
  );

  final GlobalKey<FormState> doctorStep1FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> doctorStep2FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> doctorStep3FormKey = GlobalKey<FormState>();

  bool showPassword = true;
  bool showConfirmedPassword = true;
  IconData showPasswordSuffixIcon = Icons.visibility_outlined;
  IconData showConfirmedPasswordSuffixIcon = Icons.visibility_outlined;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null && args['isDoctor'] != null) {
      isDoctor = args['isDoctor'];
    }
  }

  void toggleTab(bool signInTab) {
    if (isSignIn.value != signInTab) {
      isSignIn.value = signInTab;
      // Also clear errors and reset form if needed
      authFormKey.currentState?.reset();
    }
  }

  void visiblePassword() {
    showPassword = !showPassword;
    showPasswordSuffixIcon =
        showPassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined;
    update();
  }

  void visibleConfirmedPassword() {
    showConfirmedPassword = !showConfirmedPassword;
    showConfirmedPasswordSuffixIcon =
        showConfirmedPassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined;
    update();
  }

  // Validators
  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) return "Enter Your Email";
    if (!GetUtils.isEmail(email)) return "Invalid Email";
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) return "Enter Your password";
    if (!RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(password)) {
      return "Password must be at least 8 characters \nlong and include an uppercase letter, a lowercase letter, \na number, and a special character.";
    }
    return null;
  }

  String? fullNameValidator(String? fullName) {
    if (fullName == null || fullName.isEmpty) return "Enter Your Full Name";
    if (fullName.length < 3) {
      return "Name length should be greater than or equal 3";
    }
    return null;
  }

  String? confirmedPasswordValidator(String? confirmedPassword) {
    if (confirmedPassword == null || confirmedPassword.isEmpty) {
      return "Confirm your password";
    }
    if (passwordController.text != confirmedPassword) {
      return "Password mismatch";
    }
    return null;
  }

  String? phoneValidator(String? phone) {
    if (phone == null || phone.isEmpty) return "Enter your phone number";
    if (!GetUtils.isPhoneNumber(phone)) return "Invalid phone number";
    return null;
  }

  String? commonValidator(String? value, String fieldName) {
    if (value == null || value.isEmpty) return "Enter $fieldName";
    return null;
  }

  // Doctor Step Navigation
  void nextStep() {
    if (currentDoctorStep.value == 1) {
      if (doctorStep1FormKey.currentState!.validate()) {
        currentDoctorStep.value = 2;
        doctorRegistrationPageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else if (currentDoctorStep.value == 2) {
      if (doctorStep2FormKey.currentState!.validate()) {
        if (profileImage == null) {
          Get.snackbar("Image Required", "Please upload a profile picture");
          return;
        }
        currentDoctorStep.value = 3;
        doctorRegistrationPageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void previousStep() {
    if (currentDoctorStep.value > 1) {
      currentDoctorStep.value--;
      doctorRegistrationPageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = image;
      update();
    }
  }

  // Common Methods
  void retry() => setStatus(RequestStatus.noData);

  void showError(String title, String message) {
    setStatus(RequestStatus.failure);
    Get.snackbar(
      title,
      message,
      titleText: Text(title, style: const TextStyle(color: Colors.white)),
      messageText: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Sign In Methods
  Future<void> signIn() async {
    if (!await checkOnline()) return;

    if (authFormKey.currentState!.validate()) {
      setStatus(RequestStatus.loading);

      final result = await SignInWithEmailAndPassword()(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      result.fold((l) => showError(l.title, l.message), (r) async {
        setStatus(RequestStatus.success);
        await _sharedPrefs.setBool(CachingKeysConstants.kIsAuthedUser, true);
        if (isDoctor) {
          await Get.offAllNamed(AppRoutesName.rDoctorPortal);
        } else {
          await Get.offAllNamed(AppRoutesName.rHome);
        }
      });
    }
  }

  // Sign Up Methods
  Future<void> signUp() async {
    if (!await checkOnline()) return;

    if (authFormKey.currentState!.validate()) {
      setStatus(RequestStatus.loading);

      final result = await SignUpWithEmailAndPassword()(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        data: {
          "full_name": fullNameController.text.trim(),
          "is_doctor": isDoctor,
        },
      );

      result.fold((l) => showError(l.title, l.message), (r) async {
        setStatus(RequestStatus.success);
        try {
          final isCached = await CacheUser()(
            UserModel(
              id: r.session == null ? r.user!.aud : r.session!.user.id,
              email: emailController.text.trim(),
              fullName: fullNameController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
          isCached.fold((l) => showError("Error!", l), (_) async {
            await _sharedPrefs.setBool(
              CachingKeysConstants.kIsAuthedUser,
              true,
            );
            if (r.session != null) {
              await Get.offAllNamed(AppRoutesName.rSuccessAuth);
            } else {
              await Get.offAllNamed(AppRoutesName.rHome);
            }
          });
        } catch (e) {
          showError("Error!", e.toString());
        }
      });
    }
  }

  // Doctor Registration
  Future<void> completeDoctorRegistration() async {
    if (!await checkOnline()) return;

    if (doctorStep3FormKey.currentState!.validate()) {
      if (!termsAccepted.value) {
        Get.snackbar("Terms Required", "Please accept terms and conditions");
        return;
      }
      if (!isOnlineConsultation.value && !isInPersonConsultation.value) {
        Get.snackbar("Consultation Type", "Please select at least one type");
        return;
      }

      setStatus(RequestStatus.loading);

      // 1. Sign Up
      // Create Doctor Model
      final List<String> consultationTypes = [];
      if (isOnlineConsultation.value) consultationTypes.add("Online");
      if (isInPersonConsultation.value) consultationTypes.add("In-person");

      final doctor = DoctorModel(
        id: '', // To be generated by Supabase
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneController.text.trim(),
        specialization: specializationController.text.trim(),
        experienceYears: int.tryParse(experienceController.text.trim()) ?? 0,
        licenseNumber: licenseController.text.trim(),
        bio: bioController.text.trim(),
        sessionCost: double.tryParse(sessionCostController.text.trim()) ?? 0.0,
        consultationTypes: consultationTypes,
        clinicAddress: clinicAddressController.text.trim(),
      );

      final result = await SignUpWithEmailAndPassword()(
        email: doctor.email,
        password: doctor.password,
        data: doctor.toJson(),
      );

      result.fold((l) => showError(l.title, l.message), (r) async {
        setStatus(RequestStatus.success);
        // Cache and Navigate
        await _sharedPrefs.setBool(CachingKeysConstants.kIsAuthedUser, true);
        await Get.offAllNamed(AppRoutesName.rDoctorPortal);
      });
    }
  }

  // Social Auth
  Future<void> authWithGoogle() async {
    if (!await checkOnline()) return;
    setStatus(RequestStatus.loading);

    final result = await SignInWithGoogle()();

    result.fold((l) => showError(l.title, l.message), (r) async {
      setStatus(RequestStatus.success);

      if (!isSignIn.value && r.user != null) {
        final user = UserModel(
          id: r.user!.id,
          email: r.user!.email ?? '',
          fullName: r.user!.userMetadata?['full_name'] ?? '',
          password: '',
        );
        await CacheUser()(user);
      }

      await _sharedPrefs.setBool(CachingKeysConstants.kIsAuthedUser, true);
      await Get.offAllNamed(AppRoutesName.rHome);
    });
  }

  Future<void> authWithFacebook() async {
    if (!await checkOnline()) return;
    setStatus(RequestStatus.loading);

    final result = await SignInWithFacebook()();

    result.fold((l) => showError(l.title, l.message), (r) async {
      setStatus(RequestStatus.success);

      if (!isSignIn.value && r.user != null) {
        final user = UserModel(
          id: r.user!.id,
          email: r.user!.email ?? '',
          fullName: r.user!.userMetadata?['full_name'] ?? '',
          password: '',
        );
        await CacheUser()(user);
      }

      await _sharedPrefs.setBool(CachingKeysConstants.kIsAuthedUser, true);
      await Get.offAllNamed(AppRoutesName.rHome);
    });
  }

  Future<void> forgetPassword() async {
    await Get.toNamed(AppRoutesName.rForgetPassword);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    forgetPasswordController.dispose();
    fullNameController.dispose();
    confirmedPasswordController.dispose();
    phoneController.dispose();
    specializationController.dispose();
    experienceController.dispose();
    licenseController.dispose();
    bioController.dispose();
    sessionCostController.dispose();
    clinicAddressController.dispose();
    doctorRegistrationPageController.dispose();
    super.onClose();
  }
}
