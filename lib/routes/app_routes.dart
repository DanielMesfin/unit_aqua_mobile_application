part of 'app_pages.dart';

abstract class Routes {
  static const splashScreen = "/splash-screen";
  static const login = "/login";
  static const signUp = "/sign-up";
  static const eiditTeatement= "/edit-treatment";
  static const forgotPassword = "/forgot-password";
  static const createPassword = "/create-password";
  static const verifyOTP = "/verify-otp";
  static const home = "/home";
  static const wrapper = "/wrapper";
  static const createProfile = "/create-profile";
  static const allStore = "/all-store";
  static const viewMore = "/view-more";
  @Deprecated("user [provider] instead")
  static const store = "/store";
  static const provider = "/provider";
  static const product = "/product";
  static const book = "/book";
  static const forum = "/forum";
  static const videos = "/videos";
  static const news = "/news";
  static const market = "/market";
  static const calculator = "/calculator";
  static const farmer = "/framer";
  static const tank = "/tank";
  static const testPending = "/test-pending";
  static const farmerData = "/framer-data";
  static const treatment = "/treatment";
  static const problem = "/problem";
  static const treatmentList = "/treatment-list";
  static const treatmentDetail = "/treatment-detail";
  static const createTreatment = '/create-treatment';
  static const createTreatmentFramer = '/create-treatment-farmer';
  static const confirmation = "/confirmation";
  static const myOrders = "/my-orders";
  static const orderDetails = "/order-details";
  static const profile = "/profile";
  static const manageUserAddress = "/manage-user-address";
  static const notification = '/notification';
  static const coupon = '/coupon';
  static const userAddress = '/user-address';
  static const editProfile = "/edit-profile";
  static const settings = "/settings";
  static const review = "/review";
  static const contactUs = "/contact-us";
  static const trackNow = "/track-now";
  static const forumDetail = "/forum-detail";
  static const answerForum = "/answer-forum";
  static const createForum = "/create-forum";
  static const onBoarding = "/onboarding";
  static const info = "/info";
  static const knowledgeCenter = "/knowledge-center";
  static const forumByTopic = "/forum-by-topic";

  static const farmerrecords = "/farmerrecords";
  static const farmerdatacontent = "/farmer-data-content";
  static const tanklist = "/tank-list";
  static const tankreport = "/tank-report";

  static const hamburgermenu = "/hamburgermenu";
  static const myworkrecords = "/my-work-records";

  static const watertestreport = "/water-test-report";
  static const soiltestreport = "/soil-test-report";
  static const shrimptestreport = "/shrimp-test-report";
  static const pcrtestreport = "/pcr-test-report";
  static const fishtestreport = "/fish-test-report";
  static const feedtestreport = "/feed-test-report";
  static const culturetestform = "/culture-test-form";
  static const planktontestform = "/plankton-test-form";

  static const editprofile = "/edit-profile";
  static const bannerForReport = "/banner-for-Report";

  //report
  static const reportList = "/report-list";
  static const reportView = "/report-view";
  static const generatedReport = "/generated-report";

  //lab assistant
  static const addlabassistance = "/add-lab-assistance";
  static const labassistance = "/lab-assistance-screen";
  static const loginrequests = "/login-requests";
  static const managelabassistant = "/manage-lab-assistant";
  static const loginlabassistant = "/login-lab-assistant";
  static const viewlabassistant = "/view-lab-assistant";
  static const editlabassistant = "/edit-lab-assistant";

  //completed
  static const completed = "/completed-list";
  static const completedReportView = "/completed-report-view";
  static const myCompletedReport = "/my-completed-report-view";
}
