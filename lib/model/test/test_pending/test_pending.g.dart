// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_pending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestPending _$TestPendingFromJson(Map<String, dynamic> json) => TestPending(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TestPendingToJson(TestPending instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      water: (json['water'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
      fish: (json['fish'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
      shrimp: (json['shrimp'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
      soil: (json['soil'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
      pcr: (json['pcr'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
      feed: (json['feed'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
      culture: (json['culture'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'water': instance.water,
      'fish': instance.fish,
      'shrimp': instance.shrimp,
      'soil': instance.soil,
      'pcr': instance.pcr,
      'feed': instance.feed,
      'culture': instance.culture,
    };

Feed _$FeedFromJson(Map<String, dynamic> json) => Feed(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      depth: json['depth'] as String,
      biomass: json['biomass'] as String,
      weight: json['weight'] as String,
      planktonTest: json['planktonTest'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      tankId: (json['tankId'] as num).toInt(),
      tank: json['tank'] == null
          ? null
          : Tank.fromJson(json['tank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
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
      'tank': instance.tank,
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
