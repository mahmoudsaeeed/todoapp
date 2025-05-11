part of 'add_category_cubit.dart';

sealed class AddCategoryState {}

final class AddCategoryInitial extends AddCategoryState {}

final class AddCategoryLoading extends AddCategoryState {}

final class AddCategorySuccess extends AddCategoryState {
  final int lastIndex;

  AddCategorySuccess({required this.lastIndex});
}

final class AddCategoryFailed extends AddCategoryState {
  final Type e;

  AddCategoryFailed({required this.e});
}
