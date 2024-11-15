import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mdp2/feature/home/domain/user_model/address_model.dart';
import 'package:mdp2/feature/home/domain/user_model/company_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel with EquatableMixin {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }
}
