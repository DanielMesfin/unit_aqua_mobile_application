import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/forum/forum_answer.dart';
import 'package:unity_labs/model/user/user_model.dart';

import '../../services/secure_storage/secure_storage_service_impl.dart';

part 'forum.g.dart';

@JsonSerializable()
class ForumModel {
  final int? id;
  final int? topicId;
  final String? title;
  final String? description;
  final String? imageUrl1;
  final String? imageUrl2;
  final String? imageUrl3;
  final String? imageUrl4;
  final String? imageUrl5;
  final DateTime? createdAt;
  final UserModel? user;
  @JsonKey(name: "forum_answers")
  final List<ForumAnswer>? forumAnswers;
  @JsonKey(fromJson: _boolToRxBool, toJson: _boolFromRxBool)
  RxBool? isBookmarked;
  @JsonKey(fromJson: _boolToRxBool, toJson: _boolFromRxBool)
  RxBool? isLiked;
  ForumModel({
    this.id,
    this.topicId,
    this.title,
    this.description,
    this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
    this.imageUrl4,
    this.imageUrl5,
    this.createdAt,
    this.forumAnswers,
    this.isBookmarked,
    this.isLiked,
    this.user,
  });
  List<String> get imgUrls {
    List<String?> imageFromBackend = [
      imageUrl1,
      imageUrl2,
      imageUrl3,
      imageUrl4,
      imageUrl5,
    ];
    List<String> images = [];
    for (String? img in imageFromBackend) {
      if (img != null) {
        images.add(img);
      }
    }
    return images;
  }

  Future<bool> get isSelf async {
    final secureServiceImpl = Get.find<SecureStorageServiceImpl>();
    final userId = await secureServiceImpl.read(key: "userId");
    return int.parse(userId!) == user!.id!;
  }

  static RxBool? _boolToRxBool(bool? value) => value?.obs;
  static bool? _boolFromRxBool(RxBool? val) => val?.value;

  factory ForumModel.fromJson(Map<String, dynamic> json) =>
      _$ForumModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForumModelToJson(this);
}
