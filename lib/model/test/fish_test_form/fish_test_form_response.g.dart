// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish_test_form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FishTestFormResponse _$FishTestFormResponseFromJson(
        Map<String, dynamic> json) =>
    FishTestFormResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FishTestFormResponseToJson(
        FishTestFormResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      status: json['status'] as String,
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
      diagnosedProblemAndDisease: json['diagnosedProblemAndDisease'] as String,
      tankId: (json['tankId'] as num).toInt(),
      testId: (json['testId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
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
      'tankId': instance.tankId,
      'testId': instance.testId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
