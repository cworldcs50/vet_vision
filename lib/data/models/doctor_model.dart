import 'user_model.dart';

class DoctorModel extends UserModel {
  const DoctorModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.password,
    required this.phone,
    required this.specialization,
    required this.experienceYears,
    required this.licenseNumber,
    required this.bio,
    this.profilePictureUrl,
    required this.sessionCost,
    required this.consultationTypes,
    required this.clinicAddress,
  });

  final String phone;
  final String specialization;
  final int experienceYears;
  final String licenseNumber;
  final String bio;
  final String? profilePictureUrl;
  final double sessionCost;
  final List<String> consultationTypes;
  final String clinicAddress;

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      specialization: json['specialization'] ?? '',
      experienceYears: json['experience_years'] ?? 0,
      licenseNumber: json['license_number'] ?? '',
      bio: json['bio'] ?? '',
      profilePictureUrl: json['profile_picture_url'],
      sessionCost: (json['session_cost'] ?? 0).toDouble(),
      consultationTypes: List<String>.from(json['consultation_types'] ?? []),
      clinicAddress: json['clinic_address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'specialization': specialization,
      'experience_years': experienceYears,
      'license_number': licenseNumber,
      'bio': bio,
      'profile_picture_url': profilePictureUrl,
      'session_cost': sessionCost,
      'consultation_types': consultationTypes,
      'clinic_address': clinicAddress,
      'is_doctor': true,
    };
  }

  @override
  List<Object?> get props => [
    ...super.props,
    phone,
    specialization,
    experienceYears,
    licenseNumber,
    bio,
    profilePictureUrl,
    sessionCost,
    consultationTypes,
    clinicAddress,
  ];
}
