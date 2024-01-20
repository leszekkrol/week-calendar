part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class BrightnessChanged extends AppEvent {
  const BrightnessChanged({required this.isBright});

  final bool isBright;

  @override
  List<Object?> get props => [isBright];
}