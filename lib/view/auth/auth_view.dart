import 'package:get/get.dart';
import 'widgets/mobile_auth_view.dart';
import 'package:flutter/material.dart';
import 'widgets/desktop_auth_view.dart';
import 'widgets/tablet_auth_view.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../core/classes/request_handler.dart';
import '../../core/constants/images_constants.dart';
import '../../controller/auth/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF009689),
      body: Obx(() {
        final isSignIn = controller.isSignIn.value;

        return RequestHandlerView(
          onRetry: controller.retry,
          status: controller.requestStatus.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(
                AdaptiveLayout.getResponsiveFontSize(context, fontSize: 10.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    width: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 80,
                    ),
                    height: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 80,
                    ),
                    padding: EdgeInsets.all(
                      AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 8,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    child: Image.asset(
                      ImagesConstants.kLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Vet Vision",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 20,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 8,
                    ),
                  ),
                  Text(
                    isSignIn
                        ? "Welcome back! Sign in to continue."
                        : "Create your account today.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 5,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    child: Form(
                      key: controller.authFormKey,
                      child: AdaptiveLayout(
                        mobileLayout:
                            (context) => MobileAuthView(controller: controller),
                        tabletLayout:
                            (context) => TabletAuthView(controller: controller),
                        desktopLayout:
                            (context) =>
                                DesktopAuthView(controller: controller),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
