// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrimp_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShrimpReportResponse _$ShrimpReportResponseFromJson(
        Map<String, dynamic> json) =>
    ShrimpReportResponse(
      message: json['message'] as String?,
      response: json['RESPONSE'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShrimpReportResponseToJson(
        ShrimpReportResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      externalAbnormalColor: json['externalAbnormalColor'] as String?,
      externalLesionUclers: json['externalLesionUclers'] as String?,
      externalExcessiveMucus: json['externalExcessiveMucus'] as String?,
      externalMalformations: json['externalMalformations'] as String?,
      gillsDiscoloration: json['gillsDiscoloration'] as String?,
      gillsParasites: json['gillsParasites'] as String?,
      hepatopancreasDiscoloration:
          json['hepatopancreasDiscoloration'] as String?,
      hepatopancreasEnlargement: json['hepatopancreasEnlargement'] as String?,
      stomachForeignMaterial: json['stomachForeignMaterial'] as String?,
      stomachAbnormalities: json['stomachAbnormalities'] as String?,
      reproductiveAbnormalities: json['reproductiveAbnormalities'] as String?,
      intestineBlockages: json['intestineBlockages'] as String?,
      intestineParasites: json['intestineParasites'] as String?,
      muscleTissueDiscoloration: json['muscleTissueDiscoloration'] as String?,
      muscleTissueLesions: json['muscleTissueLesions'] as String?,
      nervousSystemAbnormalities: json['nervousSystemAbnormalities'] as String?,
      generalBehaviorWeeknessOrLethargy:
          json['generalBehaviorWeeknessOrLethargy'] as String?,
      generalBehaviorReducedFeeding:
          json['generalBehaviorReducedFeeding'] as String?,
      specificDiseaseWhiteSpotSyndromeVirus:
          json['specificDiseaseWhiteSpotSyndromeVirus'] as String?,
      specificDiseaseInfectiousHypodermalVirus:
          json['specificDiseaseInfectiousHypodermalVirus'] as String?,
      specificDiseaseRunningMortalitySydrome:
          json['specificDiseaseRunningMortalitySydrome'] as String?,
      specificDiseaseTauraSyndromeVirus:
          json['specificDiseaseTauraSyndromeVirus'] as String?,
      specificDiseaseYellowHeadVirus:
          json['specificDiseaseYellowHeadVirus'] as String?,
      specificDiseaseEarlyMortalitySydrome:
          json['specificDiseaseEarlyMortalitySydrome'] as String?,
      specificDiseaseVibrioInfections:
          json['specificDiseaseVibrioInfections'] as String?,
      specificDiseaseAeromonasInfections:
          json['specificDiseaseAeromonasInfections'] as String?,
      specificDiseaseEhp: json['specificDiseaseEHP'] as String?,
      specificDiseaseFungiAndBacteria:
          json['specificDiseaseFungiAndBacteria'] as String?,
      diagnosedProblemAndDisease: json['diagnosedProblemAndDisease'] as String?,
      externalBodyCramps: json['externalBodyCramps'] as String?,
      externalTailRoot: json['externalTailRoot'] as String?,
      externalVibrio: json['externalVibrio'] as String?,
      gillsBlackGills: json['gillsBlackGills'] as String?,
      gillsBrownGills: json['gillsBrownGills'] as String?,
      hepatopancreasShrinked: json['hepatopancreasShrinked'] as String?,
      intestineFluids: json['intestineFluids'] as String?,
      intestineWhiteFecus: json['intestineWhiteFecus'] as String?,
      intestineWhiteGut: json['intestineWhiteGut'] as String?,
      muscleTissueWhiteMuscle: json['muscleTissueWhiteMuscle'] as String?,
      suggestion: json['suggestion'] as String?,
      testId: (json['testId'] as num?)?.toInt(),
      status: json['status'] as String?,
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
      'externalAbnormalColor': instance.externalAbnormalColor,
      'externalLesionUclers': instance.externalLesionUclers,
      'externalExcessiveMucus': instance.externalExcessiveMucus,
      'externalMalformations': instance.externalMalformations,
      'gillsDiscoloration': instance.gillsDiscoloration,
      'gillsParasites': instance.gillsParasites,
      'hepatopancreasDiscoloration': instance.hepatopancreasDiscoloration,
      'hepatopancreasEnlargement': instance.hepatopancreasEnlargement,
      'stomachForeignMaterial': instance.stomachForeignMaterial,
      'stomachAbnormalities': instance.stomachAbnormalities,
      'reproductiveAbnormalities': instance.reproductiveAbnormalities,
      'intestineBlockages': instance.intestineBlockages,
      'intestineParasites': instance.intestineParasites,
      'muscleTissueDiscoloration': instance.muscleTissueDiscoloration,
      'muscleTissueLesions': instance.muscleTissueLesions,
      'nervousSystemAbnormalities': instance.nervousSystemAbnormalities,
      'generalBehaviorWeeknessOrLethargy':
          instance.generalBehaviorWeeknessOrLethargy,
      'generalBehaviorReducedFeeding': instance.generalBehaviorReducedFeeding,
      'specificDiseaseWhiteSpotSyndromeVirus':
          instance.specificDiseaseWhiteSpotSyndromeVirus,
      'specificDiseaseInfectiousHypodermalVirus':
          instance.specificDiseaseInfectiousHypodermalVirus,
      'specificDiseaseRunningMortalitySydrome':
          instance.specificDiseaseRunningMortalitySydrome,
      'specificDiseaseTauraSyndromeVirus':
          instance.specificDiseaseTauraSyndromeVirus,
      'specificDiseaseYellowHeadVirus': instance.specificDiseaseYellowHeadVirus,
      'specificDiseaseEarlyMortalitySydrome':
          instance.specificDiseaseEarlyMortalitySydrome,
      'specificDiseaseVibrioInfections':
          instance.specificDiseaseVibrioInfections,
      'specificDiseaseAeromonasInfections':
          instance.specificDiseaseAeromonasInfections,
      'specificDiseaseEHP': instance.specificDiseaseEhp,
      'specificDiseaseFungiAndBacteria':
          instance.specificDiseaseFungiAndBacteria,
      'diagnosedProblemAndDisease': instance.diagnosedProblemAndDisease,
      'suggestion': instance.suggestion,
      'testId': instance.testId,
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
