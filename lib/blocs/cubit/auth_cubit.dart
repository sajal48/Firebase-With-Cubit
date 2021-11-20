import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseloginwithcubit/repo/authrepo.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final FireAuthRepo fireAuthRepo;
  AuthCubit(this.fireAuthRepo) : super(const _AuthInitial()) {
    fireAuthRepo.getAuthInstance().authStateChanges().listen((User? user) {
      if (user == null) {
        emit(const _Unauthenticated());
      } else {
        emit(_Authenticated(user));
      }
    });
  }

  Future<void> authLoading() async {
    emit(const _AuthLoading());
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> deAuth() async {
    if (state is _Authenticated) {
      await authLoading();
      await fireAuthRepo.signOut();
      emit(const _Unauthenticated());
    }
  }

  Future<void> startAuth(String email, String password) async {
    if (state is _Unauthenticated) {
      await authLoading();
      await fireAuthRepo.signInWithCredentials(email, password);
      User? authuser = await fireAuthRepo.getUser();
      emit(_Authenticated(authuser));
    } else {
      await authLoading();
      emit(const _Unauthenticated());
    }
  }
}
