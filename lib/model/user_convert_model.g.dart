// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_convert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: const DecryptString().fromJson(json['title'] as String),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': const DecryptString().toJson(instance.title),
      'completed': instance.completed,
    };
