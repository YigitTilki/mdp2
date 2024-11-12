import 'package:equatable/equatable.dart';

class Company extends Equatable {
  const Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String?,
      catchPhrase: json['catchPhrase'] as String?,
      bs: json['bs'] as String?,
    );
  }
  final String? name;
  final String? catchPhrase;
  final String? bs;

  @override
  List<Object?> get props => [name, catchPhrase, bs];

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}
