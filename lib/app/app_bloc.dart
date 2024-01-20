import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState.initial()) {
    on<BrightnessChanged>(_onBrightnessChanged);
  }

  Future<void> _onBrightnessChanged(
    BrightnessChanged event,
    Emitter<AppState> emit,
  ) async {
    final newIsBright = event.isBright;
    emit(state.copyWith(isDarkModeEnabled: !newIsBright));
  }
}
