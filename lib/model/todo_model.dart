// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class TodoModel {
  const TodoModel({
    this.id,
    this.title,
    this.description,
    this.isCompleted = false,
  });

  final String? id;
  final String? title;
  final String? description;
  final bool isCompleted;

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
