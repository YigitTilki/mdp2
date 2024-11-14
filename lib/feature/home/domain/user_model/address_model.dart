import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address with EquatableMixin {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object?> get props => [street, suite, city, zipcode];

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
    );
  }
}
