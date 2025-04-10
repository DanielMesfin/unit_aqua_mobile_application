import '../../model/lab_assistant/lab_assistant_create.dart';
import '../../model/lab_assistant/lab_assistant_detail_response.dart';
import '../../model/lab_assistant/lab_assistant_list_response.dart';
import '../../model/lab_assistant/lab_assistant_model.dart';
import '../../model/lab_assistant/lab_assistant_pending.dart';
import '../../model/lab_assistant/lab_assistant_update.dart';
import '../../model/lab_assistant/lab_assistant_update_response.dart';

abstract class LabAssistantService {
  Future<LabAssistantListResponse> getAllLabAssistants({required int userId});
  Future<LabAssistantDetailResponse> getLabAssistantByID({required int id});
  Future<LabAssistantUpdate> updateLabAssist(
      {required int userId, required LabAssistantUpdate labassistant});
  Future<LabAssistantUpdateResponse> deleteAssistant({required String userId});
  Future<LabAssistantCreate> addLabAssistant(
      {required LabAssistantModel labAssistant});
  Future<LabAssistantPending> getPendingLabAssistants(
      {
      // required LabAssistantPending labAssistantPending,
      required int userId});
}
