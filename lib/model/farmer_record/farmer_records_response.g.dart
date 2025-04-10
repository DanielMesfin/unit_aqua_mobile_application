// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_records_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmerRecordsResponse _$FarmerRecordsResponseFromJson(
        Map<String, dynamic> json) =>
    FarmerRecordsResponse(
      message: json['message'] as String?,
      response: json['RESPONSE'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FarmerRecordsResponseToJson(
        FarmerRecordsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
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

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
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
