import 'package:firebaseloginwithcubit/blocs/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_components/login_screen_1.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _auth = BlocProvider.of<AuthCubit>(context);
    TextEditingController email = TextEditingController(text: '');
    TextEditingController password = TextEditingController(text: '');
    return LoginScreen1(
      avatarImage: '',
      emailController: email,
      googleSignIn: null,
      navigatePage: null,
      onLoginClick: () async {
        await _auth.startAuth(email.text, password.text);
      },
      passwordController: password,
    );
  }
}
