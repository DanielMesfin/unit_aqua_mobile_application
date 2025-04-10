
import 'package:get/get.dart';

import '../../model/lab_assistant/lab_assistant_create.dart';
import '../../model/lab_assistant/lab_assistant_detail_response.dart';
import '../../model/lab_assistant/lab_assistant_list_response.dart';
import '../../model/lab_assistant/lab_assistant_model.dart';
import '../../model/lab_assistant/lab_assistant_pending.dart';
import '../../model/lab_assistant/lab_assistant_update.dart';
import '../../model/lab_assistant/lab_assistant_update_response.dart';
import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';
import 'lab_assistant_service.dart';

class LabAssistantServiceImpl extends LabAssistantService {
  final HttpService _httpService = Get.find<HttpServiceImpl>();

  @override
  Future<LabAssistantListResponse> getAllLabAssistants(
      {required int userId}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.alllabassist}?userId=$userId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = LabAssistantListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<LabAssistantDetailResponse> getLabAssistantByID(
      {required int id}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.labassist}/$id',
      headerType: HeaderType.secured,
    );
    final parsedResponse = LabAssistantDetailResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<LabAssistantCreate> addLabAssistant(
      {required LabAssistantModel labAssistant}) async {
    final response = await _httpService.postRequest(
      data: labAssistant.toJson(),
      urlPath: Apis.addlabassist,
      headerType: HeaderType.secured,
    );
    final parsedResponse = LabAssistantCreate.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<LabAssistantUpdate> updateLabAssist(
      {required int userId, required LabAssistantUpdate labassistant}) async {
    final response = await _httpService.putRequest(
      urlPath: '${Apis.updatelabassist}/$userId',
      data: labassistant.toJson(),
      headerType: HeaderType.secured,
    );
    final parsedResponse = LabAssistantUpdate.fromJson(response.data);
    return parsedResponse;
  }

  //delete
  @override
  Future<LabAssistantUpdateResponse> deleteAssistant(
      {required String userId}) async {
    final response = await _httpService.deleteRequest(
      data: {},
      urlPath: '${Apis.updatelabassist}/$userId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = LabAssistantUpdateResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<LabAssistantPending> getPendingLabAssistants(
      {
      // required LabAssistantPending labAssistantPending,
      required int userId}) async {
    final response = await _httpService.getRequest(
      //data: labAssistantPending.toJson(),
      urlPath: '${Apis.pendinglabassist}?userId=$userId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = LabAssistantPending.fromJson(response.data);
    return parsedResponse;
  }
}
