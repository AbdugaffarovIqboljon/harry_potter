import 'package:json_annotation/json_annotation.dart';

part 'spell.g.dart';

@JsonSerializable(explicitToJson: true)
class Spell {
  String id;
  String name;
  String description;

  Spell({required this.id, required this.name, required this.description});

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);

  Map<String, dynamic> spellToJson() => _$SpellToJson(this);
}