import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'news_model.dart';

part 'news_list_response.g.dart';

@JsonSerializable()
class NewsListResponse extends BaseModel {
  @JsonKey(name: "result")
  final List<NewsModel>? newsList;
  NewsListResponse({
    this.newsList,
  });

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsListResponseToJson(this);
}
