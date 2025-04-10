import 'package:get/get.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';
import '../../model/completed/completed_list.dart';

import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';
import 'completed_service.dart';

class CompletedServiceImpl extends CompletedServices {
  final HttpService _httpService = Get.find<HttpServiceImpl>();

  @override
  Future<CompletedList> completedList({String? dateTime}) async {
    final authServiceImpl = Get.find<AuthServiceImpl>();
    dateTime ?? (dateTime = "all");
    final response = await _httpService.getRequest(
      urlPath:
          '${Apis.completedlists}/${authServiceImpl.userData!.id}/$dateTime',
      headerType: HeaderType.secured,
    );
    final parsedResponse = CompletedList.fromJson(response.data);
    return parsedResponse;
  }
}
