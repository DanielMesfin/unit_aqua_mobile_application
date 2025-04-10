import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? phoneNumber;
  final int? pin;
  final String? qualification;
  final String? state;
  final String? district;
  final String? area;
  final String? labName;
  final DateTime? createdAt;
  final File? labLogo;
  final File? labImage;
  final File? labReportImage;
  final String? labReport;
  final String? status;
  final int? userId;
  UserModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.pin,
    this.qualification,
    this.state,
    this.district,
    this.area,
    this.labName,
    this.createdAt,
    this.labLogo,
    this.labImage,
    this.labReportImage,
    this.labReport,
    this.userId,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Future<Map<String, dynamic>> toJson() => _$UserModelToJson(this);
}
