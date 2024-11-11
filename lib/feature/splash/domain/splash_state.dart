import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  const SplashState({
    this.isConnected,
  });

  final bool? isConnected;

  @override
  List<Object?> get props {
    return [isConnected];
  }

  SplashState copyWith({
    bool? isConnected,
  }) {
    return SplashState(
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
