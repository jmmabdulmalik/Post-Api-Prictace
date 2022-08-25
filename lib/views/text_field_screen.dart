import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controler/cubit-class/cubit_class_cubit.dart';
import '../controler/textfield_controler.dart';
import '../models/repository/post.dart';
import '../models/utils/static_property.dart';
import 'next_screen.dart';

class TextFieldScreen extends StatelessWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Post Api'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        children: [
          const SizedBox(
            height: 100,
          ),
          StaticTextField.textField(
              title: 'Name',
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              controller: AppTextFieldControler.nameControerl),
          const SizedBox(
            height: 20,
          ),
          StaticTextField.textField(
              title: 'Email',
              icon: const Icon(
                Icons.mail,
                color: Colors.grey,
              ),
              controller: AppTextFieldControler.emailControler),
          const SizedBox(
            height: 20,
          ),
          StaticTextField.textField(
              title: 'Password',
              icon: const Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              controller: AppTextFieldControler.passwordControler),
          const SizedBox(
            height: 30,
          ),
          BlocListener<ClassCubit, PostApiState>(
            listener: (context, state) {
              if (state is PostApiLoading) {
                Fluttertoast.showToast(msg: 'Request Sending');
              } else if (state is PostApiLodaed) {
                Fluttertoast.showToast(msg: 'Data Send SuccessFull');
              } else if (state is PostError) {
                Fluttertoast.showToast(msg: state.error);
              }
            },
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const NextScreen();
                }));
                context.read<ClassCubit>().postApi();
                PostApi.email.clear();
                PostApi.password.clear();
                PostApi.name.clear();
              },
              color: Colors.red,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              child: Center(
                child: BlocBuilder<ClassCubit, PostApiState>(
                  builder: (context, state) {
                    if (state is PostApiLoading) {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    }
                    return const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
