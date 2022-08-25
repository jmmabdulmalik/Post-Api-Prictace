import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controler/cubit-class/login_cubit.dart';
import '../controler/login_repo/login_repos.dart';
import '../controler/textfield_controler.dart';
import '../models/utils/static_property.dart';
import 'otp_screen.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          children: [
            const SizedBox(
              height: 100,
            ),
            StaticTextField.textField(
              title: 'Email',
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              controller: AppTextFieldControler.loginEmail,
            ),
            const SizedBox(
              height: 20,
            ),
            StaticTextField.textField(
              title: 'Password',
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              controller: AppTextFieldControler.loginPassword,
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                }
                return MaterialButton(
                  onPressed: () {
                    context.read<LoginCubit>().postLogin(context);
                  },
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  color: Colors.red,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
