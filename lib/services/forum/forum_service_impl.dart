import 'package:get/get.dart';
import 'package:unity_labs/model/base/base_model.dart';
import 'package:unity_labs/model/forum/forum_answer_list_response.dart';
import 'package:unity_labs/model/forum/forum_bookmark_response.dart';
import 'package:unity_labs/model/forum/forum_list_response.dart';
import 'package:unity_labs/model/forum/forum_answer.dart';
import 'package:unity_labs/model/forum/forum_reply_response.dart';
import 'package:unity_labs/model/forum/forum_reply.dart';
import 'package:unity_labs/model/forum/forum_topic_response.dart';
import 'package:unity_labs/services/forum/forum_services.dart';

import '../../model/forum/create_forum.dart';
import '../../model/forum/forum_answer_response.dart';
import '../../model/forum/forum_response.dart';
import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';

class ForumServiceImpl extends ForumServices {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  @override
  Future<ForumAnswerResponse> answerForum(
      {required ForumAnswer forumAnswer}) async {
    final response = await _httpService.postRequest(
      data: await forumAnswer.toJson(),
      urlPath: Apis.forumAnswer,
      headerType: HeaderType.file,
    );
    final parsedResponse = ForumAnswerResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumBookmarkResponse> bookmarkForum({required int forumId}) async {
    final response = await _httpService.getRequest(
      data: {"forumId": forumId},
      urlPath: Apis.forumBookmark,
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumBookmarkResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumResponse> createForum({required CreateForumModel forum}) async {
    final response = await _httpService.postRequest(
      data: await forum.toJson(),
      urlPath: Apis.forum,
      headerType: HeaderType.file,
    );
    final parsedResponse = ForumResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumListResponse> getAllForums() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.forum,
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumResponse> getForumInfo({required int forumId}) async {
    final response = await _httpService.getRequest(
      urlPath: "${Apis.getForum}/$forumId",
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<BaseModel> unbookmarkForum({required int forumId}) async {
    final response = await _httpService.deleteRequest(
      data: {},
      queryParam: {"forumId": forumId},
      urlPath: Apis.forumBookmark,
      headerType: HeaderType.secured,
    );
    final parsedResponse = BaseModel.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumListResponse> getAllBookmarks() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.myBookmarks,
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumListResponse> getAllByTopic({required int topicId}) async {
    final response = await _httpService.getRequest(
      urlPath: Apis.forum,
      data: {"topicId": topicId},
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumTopicResponse> getAllForumTopics() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.forumTopic,
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumTopicResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumAnswerListResponse> getAllMyAnswers() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.myAnswer,
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumAnswerListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumListResponse> getAllMyQuestions() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.myQuestions,
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumBookmarkResponse> likeForum({required int forumId}) async {
    final response = await _httpService.getRequest(
      data: {"forumId": forumId},
      urlPath: Apis.forumLike,
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumBookmarkResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<BaseModel> unlikeForum({required int forumId}) async {
    final response = await _httpService.deleteRequest(
      data: {},
      queryParam: {"forumId": forumId},
      urlPath: Apis.forumLike,
      headerType: HeaderType.secured,
    );
    final parsedResponse = BaseModel.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumReplyResponse> replyForum(
      {required ForumReply forumReply,
      required int userId,
      required String content}) async {
    print("thhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    print("content: $content");
    print("userId: $userId");
    final response = await _httpService.postRequest(
      data: {"userId": userId, "content": forumReply.content},
      // data: await forumReply.toJson(),

      urlPath:
          '${Apis.forumReplyAnswer}/${forumReply.forumAnswerId}/$userId/$content',
      headerType: HeaderType.file,
    );
    final parsedResponse = ForumReplyResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<BaseModel> likeForumReply({required int forumReplyId}) async {
    final response = await _httpService.getRequest(
      data: {"forumReplyId": forumReplyId},
      urlPath: Apis.forumReplyLike,
      headerType: HeaderType.secured,
    );
    final parsedResponse = BaseModel.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<BaseModel> unlikeForumReply({required int forumReplyId}) async {
    final response = await _httpService.deleteRequest(
      data: {},
      queryParam: {"forumReplyId": forumReplyId},
      urlPath: Apis.forumReplyLike,
      headerType: HeaderType.secured,
    );
    final parsedResponse = BaseModel.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<BaseModel> deleteForum({required int forumId}) async {
    final response = await _httpService.deleteRequest(
      data: {},
      queryParam: {"forumId": forumId},
      urlPath: Apis.forum,
      headerType: HeaderType.secured,
    );
    final parsedResponse = BaseModel.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumListResponse> searchForum({required String search}) async {
    final response = await _httpService.getRequest(
      urlPath: Apis.searchForum,
      data: {"search": search},
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumListResponse.fromJson(response.data);
    return parsedResponse;
  }
}
