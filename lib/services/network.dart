import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:harry_potter_with_pagination/core/apis.dart';
import 'package:harry_potter_with_pagination/model/character_model.dart';
import 'package:harry_potter_with_pagination/model/spell.dart';
import 'package:harry_potter_with_pagination/model/user_convert_model.dart';
import 'package:http/http.dart' as http;

sealed class Network {

  /// #Method GET
  static Future<String?> methodGet({
    required String api,
    Object? id,
    Map<String, String> headers = Apis.headers,
    String baseUrl = Apis.baseUrl,
    Map<String, String>? query,
  }) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}", query);
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return utf8.decoder.convert(response.bodyBytes);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///parsingToCharacterList
  static List<Character> harry(String data) {
    final List result = jsonDecode(data);
    final List<Character> characters = [];
    for (int i = 0; i < result.length; i++) {
      characters.add(Character.fromJson(result[i]));
    }
    return characters;
  }

  /// #parsingToSpellList
  static List<Spell> parseSpell(String data) {
    final List result = jsonDecode(data);
    final List<Spell> spells = [];
    for (int i = 0; i < result.length; i++) {
      spells.add(Spell.fromJson(result[i]));
    }
    return spells;
  }

  /// #parsingToStuffsPage
  static List<Character> parseStuffs(String data) {
    final List result = jsonDecode(data);
    final List<Character> stuffs = [];
    for (int i = 0; i < result.length; i++) {
      stuffs.add(Character.fromJson(result[i]));
    }
    return stuffs;
  }

  /// #Parsing Users
  static List<Todo> parseUsers(String data) {
    final List result = jsonDecode(data);
    final List<Todo> todos = [];
    for (int i = 0; i < result.length; i++) {
      todos.add(Todo.fromJson(result[i]));
    }
    return todos;
  }
}
