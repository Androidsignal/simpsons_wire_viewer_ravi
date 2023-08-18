import 'package:simpsons_character_viewer/infrastructure/extension/string_extensions.dart';
import 'package:simpsons_character_viewer/infrastructure/models/icon_model.dart';
import 'package:simpsons_character_viewer/infrastructure/util/constants.dart';

import 'model.dart';

class RelatedTopicModel extends Model {
  final String? firstUrl;
  final IconModel? icon;
  final String? result;
  final String? text;

  RelatedTopicModel({
    this.firstUrl,
    this.icon,
    this.result,
    this.text,
  });

  String get title => text != null ? text!.split(' - ').first : '';

  String get description =>
      text != null ? text!.splitByFirstOccurrence('-').$2.trim() : '';

  String get imageUrl => icon != null && (icon?.url?.isNotEmpty ?? false)
      ? '${Constants.imageBaseUrl}/${icon!.url}'
      : '';

  RelatedTopicModel copyWith({
    String? firstUrl,
    IconModel? icon,
    String? result,
    String? text,
  }) =>
      RelatedTopicModel(
        firstUrl: firstUrl ?? this.firstUrl,
        icon: icon ?? this.icon,
        result: result ?? this.result,
        text: text ?? this.text,
      );

  RelatedTopicModel fromJson(Map map) {
    return RelatedTopicModel(
      firstUrl: stringFromJson(map, 'FirstURL', defaultVal: ''),
      icon: IconModel().fromJson(map['Icon']),
      result: stringFromJson(map, 'Result', defaultVal: ''),
      text: stringFromJson(map, 'Text', defaultVal: ''),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'FirstURL': firstUrl,
        'Icon': icon?.toJson(),
        'Result': result,
        'Text': text,
      };
}
