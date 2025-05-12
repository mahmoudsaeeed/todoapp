import 'package:flutter/material.dart';

@immutable
class CustomDecorations extends ThemeExtension<CustomDecorations> {
  final BoxDecoration taskTileBox;
  final BoxDecoration taskPartBox;
  final BoxDecoration categoryPartBox;

  const CustomDecorations({
    required this.taskTileBox,
    required this.taskPartBox,
    required this.categoryPartBox,
  });

  @override
  CustomDecorations copyWith({
    BoxDecoration? taskTileBox,
    BoxDecoration? taskPartBox,
    BoxDecoration? categoryPartBox,
  }) {
    return CustomDecorations(
      taskTileBox: taskTileBox ?? this.taskTileBox,
      taskPartBox: taskPartBox ?? this.taskPartBox,
      categoryPartBox: categoryPartBox ?? this.categoryPartBox,
    );
  }

  @override
  CustomDecorations lerp(ThemeExtension<CustomDecorations>? other, double t) {
    if (other is! CustomDecorations) return this;
    return CustomDecorations(
      taskTileBox: BoxDecoration.lerp(taskTileBox, other.taskTileBox, t)!,
      taskPartBox: BoxDecoration.lerp(taskPartBox, other.taskPartBox, t)!,
      categoryPartBox: BoxDecoration.lerp(categoryPartBox, other.categoryPartBox, t)!,
    );
  }
}
