/// Class for api tags
class Apis {
  //USER API
  static const String user = "user";
  static const String login = "$user/login";
  static const String signup = "$user/signup";
  static const String forgot = "$user/forgot";
  static const String updateProfile = "$user/update/";

  //AUTH API
  static const String auth = "auth";

  //forum API
  static const String forum = "forum";
  static const String book = "book";
  static const String news = "news";
  static const String market = "market";
  static const String treatment = "treatment";
  static const String video = "video";
  static const String farmer = "farmer";
  static const String tank = "tank";

  static const String getForum = "forum/get";
  static const String searchForum = "$forum/search";
  static const String searchNews = "$news/search";
  static const String searchVideos = "$video/search";
  static const String forumAnswer = "$forum/answer";
  static const String forumReplyAnswer = "$forum/reply/answer";
  static const String forumBookmark = "$forum/bookmark";
  static const String forumLike = "$forum/like";
  static const String forumReplyLike = "$forum/reply/like";
  static const String forumTopic = "$forum/topic";
  static const String bookTopic = "topic";
  static const String bookByCategory = "/book/filter/";
  static const String myAnswer = "$forum/my-answers";
  static const String myQuestions = "$forum/my-questions";
  static const String myBookmarks = "$forum/my-bookmarks";

  static const String treatmentSector = "$treatment/sector";
  static const String treatmentBySector = "$treatment/find/sector/";
  static const String myTreatment = "$treatment/my";
  static const String myTreatmentBySector = "$myTreatment/sector/";
  static const String importTreatment = "$treatment/import";
  // static const String treatmentProblem = "$treatment/problem";
  static const String problemBySector = "$treatment/problem/sector/";
  static const String treatmentFarmer = "$treatment/farmer";

  static const String allMarker = "$market/all";
  static const String marketZone = "$market/find/$market/";
  static const String marketType = "$market/find/type/";
  static const String findRate = "$market/find/filter/";

  //test API
  static const String test = "test";
  static const String createTest = "$test/";
  static const String pendingTests = "$test/";

  //test form
  static const String water = "water/";
  static const String fish = "fish/";
  static const String shrimp = "shrimp/";
  static const String soil = "soil/";
  static const String feed = "feed/";
  static const String culture = "culture/";
  static const String pcr = "pcr/";
  static const String plankton = "plankton/";

  //report
  static const String waterreport = "water/";
  static const String fishreport = "fish/";
  static const String feedreport = "feed/";
  static const String shrimpreport = "shrimp/";
  static const String culturereport = "culture/";
  static const String pcrreport = "pcr/";
  static const String soilreport = "soil/";

  //lab assistant
  static const String addlabassist = "lab/create";
  static const String alllabassist = "lab";
  static const String pendinglabassist = "lab/pending";
  static const String labassist = "lab";
  static const String updatelabassist = "lab";

  //completed
  static const String completedlists = "$test/complete/";
  static const String addSuggestionToReport = "complete";
}
