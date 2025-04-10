// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterReportResponse _$WaterReportResponseFromJson(Map<String, dynamic> json) =>
    WaterReportResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaterReportResponseToJson(
        WaterReportResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num).toInt(),
      ph: json['ph'],
      temprature: json['temprature'],
      salinity: json['salinity'],
      co3: json['co3'],
      hco3: json['hco3'],
      totalAlkanility: json['totalAlkanility'],
      totalHardness: json['totalHardness'],
      ca: json['ca'],
      mg: json['mg'],
      k: json['k'],
      fe: json['fe'],
      na: json['na'],
      cl2: json['cl2'],
      tan: json['tan'],
      nh3: json['nh3'],
      no2: json['no2'],
      h2S: json['h2s'],
      co2: json['co2'],
      dissolvedOxygen: json['dissolvedOxygen'],
      electricalConductivity: json['electricalConductivity'],
      totalDissolvedSolids: json['totalDissolvedSolids'],
      testId: (json['testId'] as num).toInt(),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      tankId: (json['tankId'] as num).toInt(),
      alltest: json['alltest'] == null
          ? null
          : Alltest.fromJson(json['alltest'] as Map<String, dynamic>),
      tank: Tank.fromJson(json['tank'] as Map<String, dynamic>),
      suggestion: json['suggestion'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'ph': instance.ph,
      'temprature': instance.temprature,
      'salinity': instance.salinity,
      'co3': instance.co3,
      'hco3': instance.hco3,
      'totalAlkanility': instance.totalAlkanility,
      'totalHardness': instance.totalHardness,
      'ca': instance.ca,
      'mg': instance.mg,
      'k': instance.k,
      'fe': instance.fe,
      'na': instance.na,
      'cl2': instance.cl2,
      'tan': instance.tan,
      'nh3': instance.nh3,
      'no2': instance.no2,
      'h2s': instance.h2S,
      'co2': instance.co2,
      'dissolvedOxygen': instance.dissolvedOxygen,
      'electricalConductivity': instance.electricalConductivity,
      'totalDissolvedSolids': instance.totalDissolvedSolids,
      'testId': instance.testId,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
      'alltest': instance.alltest,
      'tank': instance.tank,
      'suggestion': instance.suggestion,
    };

Alltest _$AlltestFromJson(Map<String, dynamic> json) => Alltest(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      depth: json['depth'] as String,
      biomass: json['biomass'] as String,
      weight: json['weight'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      tankId: (json['tankId'] as num).toInt(),
    );

Map<String, dynamic> _$AlltestToJson(Alltest instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'depth': instance.depth,
      'biomass': instance.biomass,
      'weight': instance.weight,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      ph: json['ph'] as String?,
      totalHardness: json['totalHardness'],
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'ph': instance.ph,
      'totalHardness': instance.totalHardness,
    };

Tank _$TankFromJson(Map<String, dynamic> json) => Tank(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      area: json['area'] as String,
      size: json['size'] as String,
      cultureType: json['cultureType'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      farmerId: (json['farmerId'] as num).toInt(),
      farmer: Farmer.fromJson(json['farmer'] as Map<String, dynamic>),
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
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      state: json['state'] as String,
      district: json['district'] as String,
      area: json['area'] as String,
      cultureType: json['cultureType'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      userId: (json['userId'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
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
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      pin: (json['pin'] as num).toInt(),
      qualification: json['qualification'] as String,
      state: json['state'] as String,
      district: json['district'] as String,
      area: json['area'] as String,
      labName: json['labName'] as String,
      labImage: json['labImage'] as String,
      labLogo: json['labLogo'] as String,
      labReportImage: json['labReportImage'] as String,
      labReport: json['labReport'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
      approvedBy: json['approvedBy'],
      approvedDate: json['approvedDate'],
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
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
