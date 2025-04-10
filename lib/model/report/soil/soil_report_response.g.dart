// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoilReportResponse _$SoilReportResponseFromJson(Map<String, dynamic> json) =>
    SoilReportResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SoilReportResponseToJson(SoilReportResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num).toInt(),

      // soilType: json['soilType'] as String,
      // soilNature: json['soilNature'] as String,
      // soilPh: (json['soilPh'] as num).toDouble(),
      // organicCarbon: (json['organicCarbon'] as num).toDouble(),
      // availableNitrogen: (json['availableNitrogen'] as num).toDouble(),
      // prosperous: (json['prosperous'] as num).toDouble(),
      // potash: (json['potash'] as num).toDouble(),
      // sulphur: (json['sulphur'] as num).toDouble(),
      // zinc: (json['zinc'] as num).toDouble(),
      //       iron: json['iron'] as String,
      // boran: (json['boran'] as num).toDouble(),
      soilType: json['soilType'] as String,
      soilNature: json['soilNature'] as String,
      soilPh: json['soilPh'] is String
          ? double.parse(json['soilPh'])
          : (json['soilPh'] as num).toDouble(),
      organicCarbon: json['organicCarbon'] as String,
      availableNitrogen: json['availableNitrogen'] as String,
      prosperous: json['prosperous'] as String,
      potash: json['potash'] is String
          ? double.parse(json['potash'])
          : (json['potash'] as num).toDouble(),
      sulphur: json['sulphur'] as String,
      zinc: json['zinc'] is String
          ? double.parse(json['zinc'])
          : (json['zinc'] as num).toDouble(),
      boran: json['boran'] is String
          ? double.parse(json['boran'])
          : (json['boran'] as num).toDouble(),
      iron: json['iron'] as String,
      suggestion: json['suggestion'] as String,
      limeTest: json['limeTest'] as String,
      observationType: json['observationType'] as String,
      observation: json['observation'] as String,
      testId: (json['testId'] as num).toInt(),
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      tankId: (json['tankId'] as num).toInt(),
      alltest: Alltest.fromJson(json['alltest'] as Map<String, dynamic>),
      tank: Tank.fromJson(json['tank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'soilType': instance.soilType,
      'soilNature': instance.soilNature,
      'soilPh': instance.soilPh,
      'organicCarbon': instance.organicCarbon,
      'availableNitrogen': instance.availableNitrogen,
      'prosperous': instance.prosperous,
      'potash': instance.potash,
      'sulphur': instance.sulphur,
      'zinc': instance.zinc,
      'iron': instance.iron,
      'boran': instance.boran,
      'limeTest': instance.limeTest,
      'observationType': instance.observationType,
      'observation': instance.observation,
      'testId': instance.testId,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
      'alltest': instance.alltest,
      'tank': instance.tank,
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
