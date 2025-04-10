// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pcr_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PcrReportResponse _$PcrReportResponseFromJson(Map<String, dynamic> json) =>
    PcrReportResponse(
      message: json['message'] as String?,
      response: json['RESPONSE'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PcrReportResponseToJson(PcrReportResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      
      enterocytozoonResult: json['enterocytozoonResult'] as String?,
      enterocytozoonCtValue:
          (json['enterocytozoonCtValue'] as num?)?.toDouble(),
      emsResult: json['emsResult'] as String?,
      emsCtValue: (json['emsCtValue'] as num?)?.toDouble(),
      ihhnvResult: json['ihhnvResult'] as String,
      ihhnvCtValue: (json['ihhnvCtValue'] as num?)?.toDouble(),
      vHarveyResult: json['vHarveyResult'] as String?,
      vHarveyCtValue: (json['vHarveyCtValue'] as num?)?.toDouble(),
      vParahaemolyticusResult: json['vParahaemolyticusResult'] as String?,
      vParahaemolyticusCtValue:
          (json['vParahaemolyticusCtValue'] as num?)?.toDouble(),
      whiteSpotResult: json['whiteSpotResult'] as String?,
      whiteSpotCtValue: (json['whiteSpotCtValue'] as num?)?.toDouble(),
      imnvResult: json['imnvResult'] as String?,
      imnvCtValue: (json['imnvCtValue'] as num?)?.toDouble(),
      remarkText: json['remarkText'] as String?,
      testId: (json['testId'] as num?)?.toInt(),
      suggestion: json['suggestion'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      tankId: (json['tankId'] as num?)?.toInt(),
      alltest: json['alltest'] == null
          ? null
          : Alltest.fromJson(json['alltest'] as Map<String, dynamic>),
      tank: json['tank'] == null
          ? null
          : Tank.fromJson(json['tank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'enterocytozoonResult': instance.enterocytozoonResult,
      'enterocytozoonCtValue': instance.enterocytozoonCtValue,
      'emsResult': instance.emsResult,
      'emsCtValue': instance.emsCtValue,
      'ihhnvResult': instance.ihhnvResult,
      'ihhnvCtValue': instance.ihhnvCtValue,
      'vHarveyResult': instance.vHarveyResult,
      'vHarveyCtValue': instance.vHarveyCtValue,
      'vParahaemolyticusResult': instance.vParahaemolyticusResult,
      'vParahaemolyticusCtValue': instance.vParahaemolyticusCtValue,
      'whiteSpotResult': instance.whiteSpotResult,
      'whiteSpotCtValue': instance.whiteSpotCtValue,
      'imnvResult': instance.imnvResult,
      'imnvCtValue': instance.imnvCtValue,
      'remarkText': instance.remarkText,
      'testId': instance.testId,
      'suggestion': instance.suggestion,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
      'alltest': instance.alltest,
      'tank': instance.tank,
    };

Alltest _$AlltestFromJson(Map<String, dynamic> json) => Alltest(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      depth: json['depth'] as String?,
      biomass: json['biomass'] as String?,
      weight: json['weight'] as String?,
      planktonTest: json['planktonTest'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      tankId: (json['tankId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AlltestToJson(Alltest instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'depth': instance.depth,
      'biomass': instance.biomass,
      'weight': instance.weight,
      'planktonTest': instance.planktonTest,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      pcr: json['pcr'] as String?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'pcr': instance.pcr,
    };

Tank _$TankFromJson(Map<String, dynamic> json) => Tank(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      area: json['area'] as String?,
      size: json['size'] as String?,
      cultureType: json['cultureType'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      farmerId: (json['farmerId'] as num?)?.toInt(),
      farmer: json['farmer'] == null
          ? null
          : Farmer.fromJson(json['farmer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TankToJson(Tank instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'area': instance.area,
      'size': instance.size,
      'cultureType': instance.cultureType,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'farmerId': instance.farmerId,
      'farmer': instance.farmer,
    };

Farmer _$FarmerFromJson(Map<String, dynamic> json) => Farmer(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      state: json['state'] as String?,
      district: json['district'] as String?,
      area: json['area'] as String?,
      cultureType: json['cultureType'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FarmerToJson(Farmer instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'state': instance.state,
      'district': instance.district,
      'area': instance.area,
      'cultureType': instance.cultureType,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      pin: (json['pin'] as num?)?.toInt(),
      qualification: json['qualification'] as String?,
      state: json['state'] as String?,
      district: json['district'] as String?,
      area: json['area'] as String?,
      labName: json['labName'] as String?,
      labImage: json['labImage'] as String?,
      labLogo: json['labLogo'] as String?,
      labReportImage: json['labReportImage'] as String?,
      labReport: json['labReport'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      approvedBy: (json['approvedBy'] as num?)?.toInt(),
      approvedDate: json['approvedDate'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'qualification': instance.qualification,
      'state': instance.state,
      'district': instance.district,
      'area': instance.area,
      'labName': instance.labName,
      'labImage': instance.labImage,
      'labLogo': instance.labLogo,
      'labReportImage': instance.labReportImage,
      'labReport': instance.labReport,
      'role': instance.role,
      'status': instance.status,
      'approvedBy': instance.approvedBy,
      'approvedDate': instance.approvedDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
