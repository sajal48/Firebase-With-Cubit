import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseloginwithcubit/blocs/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  User user;
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    final _auth = BlocProvider.of<AuthCubit>(context);
    return Container(
      color: Colors.lightGreenAccent,
      child: Center(
        child: Column(
          children: [
            Text("${user.email}"),
            TextButton(
              child: Text('LogOut'),
              onPressed: () async {
                await _auth.deAuth();
              },
            )
          ],
        ),
      ),
    );
  }
}
