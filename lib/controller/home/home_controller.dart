import 'package:get/get.dart';
import '../../core/routes/app_routes_name.dart';
import '../../core/constants/images_constants.dart';

class DoctorModel {
  final String id;
  final String name;
  final String specialization;
  final double rating;
  final int reviews;
  final double distance;
  final int price;
  final String imagePath;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.price,
    required this.imagePath,
  });
}

class HomeController extends GetxController {
  int currentNavIndex = 0;
  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Internal Medicine",
    "Dermatology",
    "Surgery",
    "Dentistry",
  ];

  final List<DoctorModel> allDoctors = [
    DoctorModel(
      id: "1",
      name: "Dr. Ahmed Hassan",
      specialization: "Small Animal Internist",
      rating: 4.9,
      reviews: 120,
      distance: 1.2,
      price: 80,
      imagePath: ImagesConstants.doctorProfile,
    ),
    DoctorModel(
      id: "2",
      name: "Dr. Sara Al-Noor",
      specialization: "Veterinary Dermatologist",
      rating: 4.8,
      reviews: 95,
      distance: 2.5,
      price: 85,
      imagePath: ImagesConstants.doctorProfile,
    ),
    DoctorModel(
      id: "3",
      rating: 4.7,
      reviews: 211,
      name: "Dr. Omar Farid",
      specialization: "Veterinary Surgeon",
      distance: 3.1,
      price: 120,
      imagePath: ImagesConstants.doctorProfile,
    ),
    DoctorModel(
      id: "4",
      name: "Dr. Layla Mostafa",
      specialization: "Exotic Animal Specialist",
      rating: 4.9,
      reviews: 74,
      distance: 5.0,
      price: 110,
      imagePath: ImagesConstants.doctorProfile,
    ),
  ];

  void changeNavIndex(int index) {
    currentNavIndex = index;
    update();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    update();
  }

  void goToDoctorProfile(DoctorModel doctor) {
    Get.toNamed(AppRoutesName.rDoctorDetails, arguments: doctor);
  }

  // Legacy mappings for buttons if we reuse them later, keeping for safety
  Future<void> goToBookAppointement() async =>
      await Get.toNamed(AppRoutesName.rBookAppointment);

  Future<void> goToHealthRecords() async =>
      await Get.toNamed(AppRoutesName.rHealthRecords);

  Future<void> goToMyPets() async => await Get.toNamed(AppRoutesName.rMyPets);
}
