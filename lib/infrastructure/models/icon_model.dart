import 'model.dart';

class IconModel extends Model {
  final String? height;
  final String? url;
  final String? width;

  IconModel({
    this.height,
    this.url,
    this.width,
  });

  IconModel copyWith({
    String? height,
    String? url,
    String? width,
  }) =>
      IconModel(
        height: height ?? this.height,
        url: url ?? this.url,
        width: width ?? this.width,
      );

  IconModel fromJson(Map map) {
    return IconModel(
      height: stringFromJson(map, 'Height', defaultVal: ''),
      url: stringFromJson(map, 'URL', defaultVal: ''),
      width: stringFromJson(map, 'Width', defaultVal: ''),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'Height': height,
        'URL': url,
        'Width': width,
      };
}
