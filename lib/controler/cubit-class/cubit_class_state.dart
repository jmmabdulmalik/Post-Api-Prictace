part of 'cubit_class_cubit.dart';

@immutable
abstract class PostApiState {}

class PostApiInitial extends PostApiState {}

class PostApiLoading extends PostApiState {}

class PostApiLodaed extends PostApiState {}

class PostError extends PostApiState {
  String error;
  PostError({required this.error});
}
