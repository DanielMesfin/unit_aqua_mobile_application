import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'book_model.dart';
part 'book_list_response.g.dart';

@JsonSerializable()
class BookListResponse extends BaseModel {
  @JsonKey(name: "result")
  final List<BookModel>? books;
  BookListResponse({
    this.books,
  });

  factory BookListResponse.fromJson(Map<String, dynamic> json) =>
      _$BookListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookListResponseToJson(this);
}
