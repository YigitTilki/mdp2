import 'package:equatable/equatable.dart';

class Address with EquatableMixin {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String?,
      suite: json['suite'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
    );
  }
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;

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

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
    };
  }
}
