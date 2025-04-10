// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FishReportResponse _$FishReportResponseFromJson(Map<String, dynamic> json) =>
    FishReportResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FishReportResponseToJson(FishReportResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num).toInt(),
      fishDetails: json['fishDetails'] as String,
      bodyColour: json['bodyColour'] as String,
      bodyTexture: json['bodyTexture'] as String,
      mucus: json['mucus'] as String,
      eyes: json['eyes'] as String,
      finsColour: json['finsColour'] as String,
      gills: json['gills'] as String,
      intestines: json['intestines'] as String,
      internalBloodLumps: json['internalBloodLumps'] as String,
      liver: json['liver'] as String,
      gut: json['gut'] as String,
      gallBladder: json['gallBladder'] as String,
      redDisease: json['redDisease'] as String,
      ulcerativeDropsy: json['ulcerativeDropsy'] as String,
      abdominalDropsy: json['abdominalDropsy'] as String,
      bodyColumnaris: json['bodyColumnaris'] as String,
      gillColumnaris: json['gillColumnaris'] as String,
      epizooticUlcerativeSyndrome:
          json['epizooticUlcerativeSyndrome'] as String,
      dactylogyrus: json['dactylogyrus'] as String,
      gyrodactylus: json['gyrodactylus'] as String,
      trichodina: json['trichodina'] as String,
      myxobolus: json['myxobolus'] as String,
      anchorWormOrLernaea: json['anchorWormORLernaea'] as String,
      argulus: json['argulus'] as String,
      finRotOrTailrot: json['finRotORTailrot'] as String,
      hemorrhagicSepticemia: json['hemorrhagicSepticemia'] as String,
      redMouth: json['redMouth'] as String?,
      bactirialGillRoot: json['bactirialGillRoo'] as String?,
      eggORRoleInfection: json['eggOrRoeInfection'] as String?,
      fungalInfection: json['fungalInfection'] as String?,
      ichthyophthirius: json['ichthyphthirius'] as String?,
      diagnosedProblemAndDisease: json['diagnosedProblemAndDisease'] as String,
      testId: (json['testId'] as num).toInt(),
      suggestion: json['suggestion'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      tankId: (json['tankId'] as num).toInt(),
      alltest: json['alltest'] == null
          ? null
          : Alltest.fromJson(json['alltest'] as Map<String, dynamic>),
      tank: Tank.fromJson(json['tank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'fishDetails': instance.fishDetails,
      'bodyColour': instance.bodyColour,
      'bodyTexture': instance.bodyTexture,
      'mucus': instance.mucus,
      'eyes': instance.eyes,
      'finsColour': instance.finsColour,
      'gills': instance.gills,
      'intestines': instance.intestines,
      'internalBloodLumps': instance.internalBloodLumps,
      'liver': instance.liver,
      'gut': instance.gut,
      'gallBladder': instance.gallBladder,
      'redDisease': instance.redDisease,
      'ulcerativeDropsy': instance.ulcerativeDropsy,
      'abdominalDropsy': instance.abdominalDropsy,
      'bodyColumnaris': instance.bodyColumnaris,
      'gillColumnaris': instance.gillColumnaris,
      'epizooticUlcerativeSyndrome': instance.epizooticUlcerativeSyndrome,
      'dactylogyrus': instance.dactylogyrus,
      'gyrodactylus': instance.gyrodactylus,
      'trichodina': instance.trichodina,
      'myxobolus': instance.myxobolus,
      'anchorWormORLernaea': instance.anchorWormOrLernaea,
      'argulus': instance.argulus,
      'finRotORTailrot': instance.finRotOrTailrot,
      'hemorrhagicSepticemia': instance.hemorrhagicSepticemia,
      'diagnosedProblemAndDisease': instance.diagnosedProblemAndDisease,
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
