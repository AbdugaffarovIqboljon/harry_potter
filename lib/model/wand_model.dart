import 'package:json_annotation/json_annotation.dart';

part 'wand_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Wand {
  String wood;
  String core;
  num? length;

  Wand({required this.wood, required this.core, required this.length});

  factory Wand.fromJson(Map<String, dynamic> json) => _$WandFromJson(json);

  Map<String, dynamic> toJson() => _$WandToJson(this);
}
