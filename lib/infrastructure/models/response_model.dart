import '../util/enums.dart';
import '../util/utils.dart';
import 'model.dart';
import 'related_topic_model.dart';

class ResponseModel extends Model {
  final ApiStatusCode statusCode;
  final String message;
  final String? heading;
  final List<RelatedTopicModel>? relatedTopics;

  ResponseModel({
    this.statusCode = ApiStatusCode.unknown,
    this.message = '',
    this.heading,
    this.relatedTopics = const [],
  });

  bool get isSuccess => statusCode == ApiStatusCode.success;

  bool get isError => statusCode == ApiStatusCode.error;

  ResponseModel success({
    Map<String, dynamic> data = const {},
  }) =>
      ResponseModel(
        statusCode: ApiStatusCode.success,
        heading: stringFromJson(data, 'Heading', defaultVal: ''),
        relatedTopics: data['RelatedTopics'] == null
            ? null
            : List<RelatedTopicModel>.from(data['RelatedTopics']
                .map((x) => RelatedTopicModel().fromJson(x))),
      );

  factory ResponseModel.error({
    String? message,
    dynamic error,
  }) {
    return ResponseModel(
      statusCode: ApiStatusCode.error,
      message: Utils.getExceptionMessage(message: message, error: error),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'Heading': heading,
        'RelatedTopics': relatedTopics == null
            ? []
            : List<dynamic>.from(relatedTopics!.map((x) => x.toJson())),
      };
}
