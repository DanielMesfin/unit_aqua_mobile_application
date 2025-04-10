import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/common/extensions/utils.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    if (json.contains(".")) {
      json = json.substring(0, json.length - 1);
    }

    return DateTime.parse(json).toLocalDateTime();
  }

  @override
  String toJson(DateTime json) => json.toIso8601String();
}
