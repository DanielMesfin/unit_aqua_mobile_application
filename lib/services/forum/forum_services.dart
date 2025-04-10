import 'package:unity_labs/model/base/base_model.dart';
import 'package:unity_labs/model/forum/forum_answer.dart';
import 'package:unity_labs/model/forum/forum_answer_response.dart';
import 'package:unity_labs/model/forum/forum_list_response.dart';
import 'package:unity_labs/model/forum/forum_reply.dart';
import 'package:unity_labs/model/forum/forum_topic_response.dart';

import '../../model/forum/create_forum.dart';
import '../../model/forum/forum_answer_list_response.dart';
import '../../model/forum/forum_bookmark_response.dart';
import '../../model/forum/forum_reply_response.dart';
import '../../model/forum/forum_response.dart';

abstract class ForumServices {
  Future<ForumResponse> createForum({required CreateForumModel forum});
  Future<ForumListResponse> getAllForums();
  Future<BaseModel> deleteForum({required int forumId});
  Future<ForumListResponse> searchForum({required String search});
  Future<ForumTopicResponse> getAllForumTopics();
  Future<ForumListResponse> getAllByTopic({required int topicId});
  Future<ForumListResponse> getAllBookmarks();
  Future<ForumListResponse> getAllMyQuestions();
  Future<ForumAnswerListResponse> getAllMyAnswers();
  Future<ForumResponse> getForumInfo({required int forumId});
  Future<ForumBookmarkResponse> bookmarkForum({required int forumId});
  Future<BaseModel> unbookmarkForum({required int forumId});
  Future<ForumAnswerResponse> answerForum({required ForumAnswer forumAnswer});
  Future<ForumReplyResponse> replyForum(
      {required ForumReply forumReply,
      required int userId,
      required String content});
  Future<ForumBookmarkResponse> likeForum({required int forumId});
  Future<BaseModel> unlikeForum({required int forumId});
  Future<BaseModel> likeForumReply({required int forumReplyId});
  Future<BaseModel> unlikeForumReply({required int forumReplyId});
}
