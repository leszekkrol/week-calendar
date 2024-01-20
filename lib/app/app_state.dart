part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({required this.isDarkModeEnabled});

  const AppState.initial() : this(isDarkModeEnabled: true);

  final bool isDarkModeEnabled;

  @override
  List<Object?> get props => [isDarkModeEnabled];

  AppState copyWith({bool? isDarkModeEnabled}) {
    return AppState(
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
    );
  }
}