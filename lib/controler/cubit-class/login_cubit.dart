import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../views/otp_screen.dart';
import '../login_repo/login_repos.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  postLogin(BuildContext context) async {
    emit(LoginLoading());
    try {
      final login = await LoginApi.loginApi();
      if (login == 200) {
        emit(LoginInitial());
        Fluttertoast.showToast(msg: 'Login Successes Full ');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const OtpScreen();
        }));
      } else if (login == 501) {
        emit(LoginInitial());
        Fluttertoast.showToast(msg: 'Network Error');
      } else if (login == 400) {
        emit(LoginInitial());
        Fluttertoast.showToast(msg: 'Server Error');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '${e.toString()}');
    }
  }
}
