import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_api/models/repository/post.dart';
import 'package:meta/meta.dart';

part 'cubit_class_state.dart';

class ClassCubit extends Cubit<PostApiState> {
  ClassCubit() : super(PostApiInitial());

  Future postApi() async {
    emit(PostApiLoading());
    print('Loading');
    try {
      final postApi = await PostApi.postApi();
      debugPrint("$postApi");
      if (postApi == 200) {
        emit(PostApiLodaed());
      } else if (postApi == 501) {
        emit(PostError(error: 'NetWork Error'));
      } else if (postApi == 400) {
        emit(PostError(error: 'Server Error'));
      }
    } catch (e) {
      print(e);
    }
  }
}
