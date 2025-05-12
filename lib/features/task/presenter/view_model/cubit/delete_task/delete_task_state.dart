part of 'delete_task_cubit.dart';

sealed class DeleteTaskState {}

final class DeleteTaskInitial extends DeleteTaskState {}
final class DeleteTaskLoading extends DeleteTaskState {}
final class DeleteTaskSuccess extends DeleteTaskState {}
final class DeleteTaskFailed extends DeleteTaskState {}
