import '../../data/base_model/base_model.dart';

class ApiResponse {
  var isSuccess = false;
  var isFailure = false;
  var isUnAuthorized = false;
  var message = "Something went wrong";
  late String? responseStatus;

  ApiResponse.fromApiResponse(BaseModel? response) {
    if (response == null) {
      return;
    }
    responseStatus = response.status;

    if (response.status != "failure") {
      isSuccess = true;
      message = response.message ?? "success";
    } else {
      isFailure = true;
      message = response.message!;
      // switch (response.error) {
      //   case "Incorrect Password":
      //     message = "Incorrect Email Address or Password";
      //     break;
      //   case "Already Verified ":
      //     message = "Already Verified";
      //     break;
      //   default:
      // }
    }
  }
}
