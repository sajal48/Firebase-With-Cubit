part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({AuthState? status, User? user}) = _AuthState;
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.authenticated(User? user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
}
