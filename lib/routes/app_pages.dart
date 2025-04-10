import 'package:get/get.dart';
import 'package:unity_labs/views/answer_forum/answer_forum_binding.dart';
import 'package:unity_labs/views/answer_forum/answer_forum_view.dart';
import 'package:unity_labs/views/book/book_binding.dart';
import 'package:unity_labs/views/book/book_view.dart';
import 'package:unity_labs/views/bottom_nav/bottom_nav_binding.dart';
import 'package:unity_labs/views/bottom_nav/bottom_nav_controller.dart';
import 'package:unity_labs/views/bottom_nav/bottom_nav_view.dart';
import 'package:unity_labs/views/calculator/calculator_binding.dart';
import 'package:unity_labs/views/calculator/calculator_view.dart';
import 'package:unity_labs/views/change_password/change_password_binding.dart';
import 'package:unity_labs/views/change_password/change_password_view.dart';
import 'package:unity_labs/views/create_forum/create_forum_binding.dart';
import 'package:unity_labs/views/create_forum/create_forum_view.dart';
import 'package:unity_labs/views/create_treatment/create_treatment_binding.dart';
import 'package:unity_labs/views/create_treatment/create_treatment_view.dart';
import 'package:unity_labs/views/create_treatment_farmer/create_treatment_farmer_binding.dart';
import 'package:unity_labs/views/create_treatment_farmer/create_treatment_farmer_view.dart';
import 'package:unity_labs/views/edit_treatment/edit_treatment_binding.dart';
import 'package:unity_labs/views/edit_treatment/edit_treatment_view.dart';
import 'package:unity_labs/views/farmer_registration/farmer_registration_binding.dart';
import 'package:unity_labs/views/farmer_registration/farmer_registration_view.dart';
import 'package:unity_labs/views/forgot_password/forgot_password_view.dart';
import 'package:unity_labs/views/forum/forum_binding.dart';
import 'package:unity_labs/views/forum/forum_by_topic.dart';
import 'package:unity_labs/views/forum/forum_view.dart';
import 'package:unity_labs/views/forum_detail/forum_detail_view.dart';
import 'package:unity_labs/views/farmer/farmer_view.dart';
import 'package:unity_labs/views/login/login_binding.dart';
import 'package:unity_labs/views/login/login_view.dart';
import 'package:unity_labs/views/market/market_binding.dart';
import 'package:unity_labs/views/market/market_view.dart';
import 'package:unity_labs/views/my_work_records/my_completed_work/completed_report_view/completed_report_view_binding.dart';
import 'package:unity_labs/views/my_work_records/my_completed_work/completed_report_view/completed_report_view_view.dart';
import 'package:unity_labs/views/news/news_binding.dart';
import 'package:unity_labs/views/news/news_view.dart';
import 'package:unity_labs/views/problem/problem_binding.dart';
import 'package:unity_labs/views/problem/problem_view.dart';
import 'package:unity_labs/views/signup/signup_binding.dart';
import 'package:unity_labs/views/signup/signup_view.dart';
import 'package:unity_labs/views/tank/tank_binding.dart';
import 'package:unity_labs/views/tank/tank_view.dart';
import 'package:unity_labs/views/test_pending/test_pending_binding.dart';
import 'package:unity_labs/views/test_pending/test_pending_view.dart';
import 'package:unity_labs/views/test_report_forms/plankton_test_report/plankton_test_report_view.dart';
import 'package:unity_labs/views/treatment_detail/treatment_detail_binding.dart';
import 'package:unity_labs/views/treatment_detail/treatment_detail_view.dart';
import 'package:unity_labs/views/treatment_list/treatment_list_binding.dart';
import 'package:unity_labs/views/videos/video_binding.dart';
import 'package:unity_labs/views/videos/videos_view.dart';

import '../views/completed/completed_list_binding.dart';
import '../views/completed/completed_list_view.dart';
import '../views/completed/completed_report_view/completed_report_view_binding.dart';
import '../views/completed/completed_report_view/completed_report_view_view.dart';
import '../views/lab_asst_manage/add_lab_assistance/add_lab_assistance_binding.dart';
import '../views/lab_asst_manage/add_lab_assistance/add_lab_assistance_view.dart';
import '../views/banner_for_report/banner_for_report_binding.dart';
import '../views/banner_for_report/banner_for_report_view.dart';
import '../views/edit_profile/edit_profile_binding.dart';
import '../views/edit_profile/edit_profile_view.dart';
import '../views/farmer_records/farmer_data/farmer_data_binding.dart';
import '../views/farmer_records/farmer_data/farmer_data_view.dart';
import '../views/farmer_records/farmer_records_binding.dart';
import '../views/farmer_records/farmer_records_view.dart';
import '../views/farmer_records/tank_list/tank_list_binding.dart';
import '../views/farmer_records/tank_list/tank_list_view.dart';
import '../views/farmer_records/tank_report/tank_report_binding.dart';
import '../views/farmer_records/tank_report/tank_report_view.dart';
import '../views/forgot_password/forgot_password_binding.dart';
import '../views/forum_detail/forum_detail_binding.dart';
import '../views/farmer/farmer_binding.dart';
import '../views/humburgermenu/humburgermenu_binding.dart';
import '../views/humburgermenu/humburgermenu_view.dart';
import '../views/lab_asst_manage/lab_assistance_screen/lab_assistance_binding.dart';
import '../views/lab_asst_manage/lab_assistance_screen/lab_assistance_view.dart';
import '../views/lab_asst_manage/login_requests/login_requests_binding.dart';
import '../views/lab_asst_manage/login_requests/login_requests_view.dart';
import '../views/lab_asst_manage/manage_lab_assistant/edit_assistant.dart';
import '../views/lab_asst_manage/manage_lab_assistant/manage_lab_assistant_binding.dart';
import '../views/lab_asst_manage/manage_lab_assistant/manage_lab_assistant_view.dart';
import '../views/lab_asst_manage/manage_lab_assistant/view_assistant.dart';
import '../views/login_request_lab_assist/login_lab_assist_binding.dart';
import '../views/login_request_lab_assist/login_lab_assist_view.dart';
import '../views/my_work_records/my_work_records_binding.dart';
import '../views/my_work_records/my_work_records_view.dart';
import '../views/profile/profile_binding.dart';
import '../views/profile/profile_view.dart';
import '../views/reports/generated_report/generated_report_binding.dart';
import '../views/reports/generated_report/generated_report_view.dart';
import '../views/reports/report_list_binding.dart';
import '../views/reports/report_list_view.dart';
import '../views/reports/report_view/report_view_binding.dart';
import '../views/reports/report_view/report_view_view.dart';
import '../views/test_report_forms/culture_test_report/culture_test_report_binding.dart';
import '../views/test_report_forms/culture_test_report/culture_test_report_view.dart';
import '../views/test_report_forms/feed_test_report/feed_test_report_binding.dart';
import '../views/test_report_forms/feed_test_report/feed_test_report_view.dart';
import '../views/test_report_forms/fish_test_report/fish_test_report_binding.dart';
import '../views/test_report_forms/fish_test_report/fish_test_report_view.dart';
import '../views/test_report_forms/pcr_test_report/pcr_test_report_binding.dart';
import '../views/test_report_forms/pcr_test_report/pcr_test_report_view.dart';
import '../views/test_report_forms/plankton_test_report/plankton_test_report_binding.dart';
import '../views/test_report_forms/shrimp_test_report/shrimp_test_report_binding.dart';
import '../views/test_report_forms/shrimp_test_report/shrimp_test_report_view.dart';
import '../views/test_report_forms/soil_test_report/soil_test_report_binding.dart';
import '../views/test_report_forms/soil_test_report/soil_test_report_view.dart';
import '../views/test_report_forms/water_test_report/water_test_report_binding.dart';
import '../views/test_report_forms/water_test_report/water_test_report_view.dart';
import '../views/treatment_list/treatment_list_view.dart';
import '../views/wrapper/wrapper.dart';
import '../views/wrapper/wrapper_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.wrapper;
  static final routes = [
    GetPage(
      name: Routes.wrapper,
      page: () => const Wrapper(),
      binding: WrapperBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => BottomNavView(
        openDrawerCallback: Get.find<BottomNavController>().openDrawer,
        scaffoldKey: Get.find<BottomNavController>().scaffoldKeytwo,
      ),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.calculator,
      page: () => const CalculatorView(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: Routes.forumDetail,
      page: () => const ForumDetailView(),
      binding: ForumDetailBinding(),
    ),
    GetPage(
      name: Routes.answerForum,
      page: () => const AnswerForumView(),
      binding: AnswerForumBinding(),
    ),
    GetPage(
      name: Routes.createForum,
      page: () => const CreateForumView(),
      binding: CreateForumBinding(),
    ),
    GetPage(
      name: Routes.book,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
    GetPage(
      name: Routes.forum,
      page: () => const ForumView(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: Routes.forumByTopic,
      page: () => const ForumByTopic(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: Routes.videos,
      page: () => const VideosView(),
      binding: VideosBinding(),
    ),
    GetPage(
      name: Routes.news,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: Routes.market,
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.farmer,
      page: () => const FarmerRegistrationView(),
      binding: FarmerRegistrationBinding(),
    ),
    GetPage(
      name: Routes.farmerData,
      page: () => FarmerView(),
      binding: FarmerBinding(),
    ),
    GetPage(
      name: Routes.problem,
      page: () => const ProblemView(),
      binding: ProblemBinding(),
    ),
    GetPage(
      name: Routes.treatmentList,
      page: () => const TreatmentListView(),
      binding: TreatmentListBinding(),
    ),
    GetPage(
      name: Routes.createTreatment,
      page: () => const CreateTreatmentView(),
      binding: CreateTreatmentBinding(),
    ),
// edit treatment
    GetPage(
      name: Routes.eiditTeatement,
      page: () => const EditTreatmentView(),
      binding: EditTreatmentBinding(),
    ),

    GetPage(
      name: Routes.createTreatmentFramer,
      page: () => const CreateTreatmentFramerView(),
      binding: CreateTreatmentFramerBinding(),
    ),
    GetPage(
      name: Routes.treatmentDetail,
      page: () => const TreatmentDetailView(),
      binding: TreatmentDetailBinding(),
    ),
    GetPage(
      name: Routes.createPassword,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.tank,
      page: () => TankView(),
      binding: TankBinding(),
    ),
    GetPage(
      name: Routes.testPending,
      page: () => const TestPendingView(),
      binding: TestPendingBinding(),
    ),
    GetPage(
      name: Routes.farmerrecords,
      page: () => const FarmerRecordsView(),
      binding: FarmerRecordsBinding(),
    ),
    GetPage(
      name: Routes.hamburgermenu,
      page: () => const HamburgerMenuView(),
      binding: HamburgerMenuBinding(),
    ),
    GetPage(
      name: Routes.myworkrecords,
      page: () => MyWorkRecordsView(),
      binding: MyWorkRecordsBinding(),
    ),
    GetPage(
      name: Routes.myworkrecords,
      page: () => MyWorkRecordsView(),
      binding: MyWorkRecordsBinding(),
    ),
    GetPage(
      name: Routes.tanklist,
      page: () => const TankListView(),
      binding: TankListBinding(),
    ),
    GetPage(
      name: Routes.tankreport,
      page: () => const TankReportView(),
      binding: TankReportBinding(),
    ),
    GetPage(
      name: Routes.watertestreport,
      page: () => WaterTestReportView(),
      binding: WaterTestReportBinding(),
    ),
    GetPage(
      name: Routes.soiltestreport,
      page: () => SoilTestReportView(),
      binding: SoilTestReportBinding(),
    ),
    GetPage(
      name: Routes.shrimptestreport,
      page: () => ShrimpTestReportView(),
      binding: ShrimpTestReportBinding(),
    ),
    GetPage(
      name: Routes.pcrtestreport,
      page: () => PCRTestReportView(),
      binding: PCRTestReportBinding(),
    ),
    GetPage(
      name: Routes.fishtestreport,
      page: () => FishTestReportView(),
      binding: FishTestReportBinding(),
    ),
    GetPage(
      name: Routes.feedtestreport,
      page: () => FeedTestReportView(),
      binding: FeedTestReportBinding(),
    ),
    GetPage(
      name: Routes.culturetestform,
      page: () => CultureTestReportView(),
      binding: CultureTestReportBinding(),
    ),
    GetPage(
      name: Routes.planktontestform,
      page: () => PlanktonTestReportView(),
      binding: PlanktonTestReportBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.bannerForReport,
      page: () => const BannerForReportView(),
      binding: BannerForReportBinding(),
    ),
    GetPage(
      name: Routes.reportList,
      page: () => ReportListView(),
      binding: ReportListBinding(),
    ),
    GetPage(
      name: Routes.reportView,
      page: () => ReportView(),
      binding: ReportViewBinding(),
    ),
    GetPage(
      name: Routes.generatedReport,
      page: () => GeneratedReportView(),
      binding: GeneratedReportBinding(),
    ),
    GetPage(
      name: Routes.addlabassistance,
      page: () => const AddLabAssistanceView(),
      binding: AddLabAssistanceBinding(),
    ),
    GetPage(
      name: Routes.labassistance,
      page: () => const LabAssistanceView(),
      binding: LabAssistanceBinding(),
    ),
    GetPage(
      name: Routes.loginrequests,
      page: () => const LoginRequestsView(),
      binding: LoginRequestsBinding(),
    ),
    GetPage(
      name: Routes.managelabassistant,
      page: () => const ManageLabAssistantView(),
      binding: ManageLabAssistantBinding(),
    ),
    GetPage(
      name: Routes.loginlabassistant,
      page: () => const LoginLabAssistView(),
      binding: LoginLabAssistBinding(),
    ),
    GetPage(
      name: Routes.viewlabassistant,
      page: () => const ViewLabAssistanceView(),
    ),
    GetPage(
      name: Routes.editlabassistant,
      page: () => EditLabAssistanceView(),
    ),
    GetPage(
      name: Routes.completed,
      page: () => const CompletedListView(),
      binding: CompletedListBinding(),
    ),
    GetPage(
      name: Routes.completedReportView,
      page: () => const CompletedReportView(),
      binding: CompletedReportViewBinding(),
    ),
    GetPage(
      name: Routes.myCompletedReport,
      page: () => const MyCompletedReportView(),
      binding: MyCompletedReportViewBinding(),
    ),
    GetPage(
      name: Routes.farmerdatacontent,
      page: () => const FarmerDataView(),
      binding: FarmerDataBinding(),
    ),
  ];
}
