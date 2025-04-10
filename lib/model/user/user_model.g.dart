// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      pin: (json['pin'].runtimeType == String)
          ? int.parse(json['pin'])
          : json['pin'] as int?,
      qualification: json['qualification'] as String?,
      state: json['state'] as String?,
      district: json['district'] as String?,
      area: json['area'] as String?,
      labImage: File(json['labImage']),
      labReportImage: File(json['labReportImage']),
      labLogo: File(json['labLogo']),
      labName: json['labName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(
              json['createdAt'] as String,
            ),
      userId: json['userId'] as int?,
      status: json['status'] as String?,
    );

Future<Map<String, dynamic>> _$UserModelToJson(UserModel instance) async =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'qualification': instance.qualification,
      'state': instance.state,
      'district': instance.district,
      'area': instance.area,
      'labName': instance.labName,
      'status': instance.status,
      // 'createdAt': instance.createdAt?.toIso8601String(),
      'labLogo': instance.labLogo == null
          ? null
          : await MultipartFile.fromFile(instance.labLogo!.path),
      'labImage': instance.labImage == null
          ? null
          : await MultipartFile.fromFile(instance.labImage!.path),
      'labReportImage': instance.labReportImage == null
          ? null
          : await MultipartFile.fromFile(instance.labReportImage!.path),
      'labReport': instance.labReport,
      'userId': instance.userId,
    };
