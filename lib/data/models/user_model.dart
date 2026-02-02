import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../datasource/static/cache_user.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.email,
    required this.id,
    required this.fullName,
    required this.password,
  });

  final String id, fullName, password, email;

  Future<Either<String, bool>> cacheUser(UserModel user) async =>
      await CacheUser()(user);

  @override
  List<Object?> get props => [id, fullName, password, email];
}
