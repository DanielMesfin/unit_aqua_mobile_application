import '../../model/book/book_list_response.dart';
import '../../model/forum/forum_topic_response.dart';

abstract class BookServices {
  Future<BookListResponse> getAllBooks();
  Future<ForumTopicResponse> bookCategories();
}
