import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdp2/feature/home/model/address.dart';
import 'package:mdp2/feature/home/model/company.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required Address address,
    required String phone,
    required String website,
    required Company company,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
