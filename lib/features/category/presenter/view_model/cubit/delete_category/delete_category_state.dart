part of 'delete_category_cubit.dart';

sealed class DeleteCategoryState {}

final class DeleteCategoryInitial extends DeleteCategoryState {}
final class DeleteCategoryLoading extends DeleteCategoryState {}
final class DeleteCategorySuccess extends DeleteCategoryState {
  
}
final class DeleteCategoryFailed extends DeleteCategoryState {}
