import 'package:json_annotation/json_annotation.dart';

part 'user_convert_model.g.dart';

final convert = {
  {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
};

@JsonSerializable(explicitToJson: true)
class Todo {
  final int userId;
  @DecryptString()
  final int id;
  @DecryptString()
  final String title;
  @DecryptString()
  final bool completed;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

// <client, server>
class DecryptString implements JsonConverter<String, String> {
  const DecryptString();

  @override
  String fromJson(String json) => decryptedAlgorithm(json);

  @override
  String toJson(String object) {
    return encryptedAlgorithm(object);
  }
}

String decryptedAlgorithm(String text) {
  List<String> words = text.split(' ');

  for (int i = 0; i < words.length; i++) {
    if (words[i].isNotEmpty) {
      words[i] = '${words[i][0].toUpperCase()}${words[i].substring(1)}';
    }
  }
  return words.join(' ');
}

String encryptedAlgorithm(String text) {
  return text;
}
