// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrimp_test_form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShrimpTestFormResponse _$ShrimpTestFormResponseFromJson(
        Map<String, dynamic> json) =>
    ShrimpTestFormResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShrimpTestFormResponseToJson(
        ShrimpTestFormResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

// Result _$ResultFromJson(Map<String, dynamic> json) => Result(
//       status: json['status'] as String,
//       id: (json['id'] as num).toInt(),
//       externalAbnormalColor: json['externalAbnormalColor'] as String,
//       externalLesionUclers: json['externalLesionUclers'] as String,
//       externalExcessiveMucus: json['externalExcessiveMucus'] as String,
//       externalMalformations: json['externalMalformations'] as String,
//       gillsDiscoloration: json['gillsDiscoloration'] as String,
//       gillsParasites: json['gillsParasites'] as String,
//       hepatopancreasDiscoloration:
//           json['hepatopancreasDiscoloration'] as String,
//       hepatopancreasEnlargement: json['hepatopancreasEnlargement'] as String,
//       stomachForeignMaterial: json['stomachForeignMaterial'] as String,
//       stomachAbnormalities: json['stomachAbnormalities'] as String,
//       reproductiveAbnormalities: json['reproductiveAbnormalities'] as String,
//       intestineBlockages: json['intestineBlockages'] as String,
//       intestineParasites: json['intestineParasites'] as String,
//       muscleTissueDiscoloration: json['muscleTissueDiscoloration'] as String,
//       muscleTissueLesions: json['muscleTissueLesions'] as String,
//       nervousSystemAbnormalities: json['nervousSystemAbnormalities'] as String,
//       generalBehaviorWeeknessOrLethargy:
//           json['generalBehaviorWeeknessOrLethargy'] as String,
//       generalBehaviorReducedFeeding:
//           json['generalBehaviorReducedFeeding'] as String,
//       specificDiseaseWhiteSpotSyndromeVirus:
//           json['specificDiseaseWhiteSpotSyndromeVirus'] as String,
//       specificDiseaseInfectiousHypodermalVirus:
//           json['specificDiseaseInfectiousHypodermalVirus'] as String,
//       specificDiseaseRunningMortalitySydrome:
//           json['specificDiseaseRunningMortalitySydrome'] as String,
//       specificDiseaseTauraSyndromeVirus:
//           json['specificDiseaseTauraSyndromeVirus'] as String,
//       specificDiseaseYellowHeadVirus:
//           json['specificDiseaseYellowHeadVirus'] as String,
//       specificDiseaseEarlyMortalitySydrome:
//           json['specificDiseaseEarlyMortalitySydrome'] as String,
//       specificDiseaseVibrioInfections:
//           json['specificDiseaseVibrioInfections'] as String,
//       specificDiseaseAeromonasInfections:
//           json['specificDiseaseAeromonasInfections'] as String,
//       specificDiseaseEhp: json['specificDiseaseEHP'] as String,
//       specificDiseaseFungiAndBacteria:
//           json['specificDiseaseFungiAndBacteria'] as String,
//       externalBodyCramps: json['externalBodyCramps'] as String?,
//       externalTailRoot: json['externalTailRoot'] as String?,
//       externalVibrio: json['externalVibrio'] as String?,
//       gillsBlackGills: json['gillsBlackGills'] as String?,
//       gillsBrownGills: json['gillsBrownGills'] as String?,
//       hepatopancreasShrinked: json['hepatopancreasShrinked'] as String?,
//       intestineFluids: json['intestineFluids'] as String?,
//       intestineWhiteGut: json['intestineWhiteGut'] as String?,
//       intestineWhiteFecus: json['intestineWhiteFecus'] as String?,
//       muscleTissueWhiteMuscle: json['muscleTissueWhiteMuscle'] as String?,
//       diagnosedProblemAndDisease: json['diagnosedProblemAndDisease'] as String,
//       tankId: (json['tankId'] as num).toInt(),
//       testId: (json['testId'] as num).toInt(),
//       updatedAt: json['updatedAt'] as String,
//       createdAt: json['createdAt'] as String,
//     );

// Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
//       'status': instance.status,
//       'id': instance.id,
//       'externalAbnormalColor': instance.externalAbnormalColor,
//       'externalLesionUclers': instance.externalLesionUclers,
//       'externalExcessiveMucus': instance.externalExcessiveMucus,
//       'externalMalformations': instance.externalMalformations,
//       'gillsDiscoloration': instance.gillsDiscoloration,
//       'gillsParasites': instance.gillsParasites,
//       'hepatopancreasDiscoloration': instance.hepatopancreasDiscoloration,
//       'hepatopancreasEnlargement': instance.hepatopancreasEnlargement,
//       'stomachForeignMaterial': instance.stomachForeignMaterial,
//       'stomachAbnormalities': instance.stomachAbnormalities,
//       'reproductiveAbnormalities': instance.reproductiveAbnormalities,
//       'intestineBlockages': instance.intestineBlockages,
//       'intestineParasites': instance.intestineParasites,
//       'muscleTissueDiscoloration': instance.muscleTissueDiscoloration,
//       'muscleTissueLesions': instance.muscleTissueLesions,
//       'nervousSystemAbnormalities': instance.nervousSystemAbnormalities,
//       'generalBehaviorWeeknessOrLethargy':
//           instance.generalBehaviorWeeknessOrLethargy,
//       'generalBehaviorReducedFeeding': instance.generalBehaviorReducedFeeding,
//       'specificDiseaseWhiteSpotSyndromeVirus':
//           instance.specificDiseaseWhiteSpotSyndromeVirus,
//       'specificDiseaseInfectiousHypodermalVirus':
//           instance.specificDiseaseInfectiousHypodermalVirus,
//       'specificDiseaseRunningMortalitySydrome':
//           instance.specificDiseaseRunningMortalitySydrome,
//       'specificDiseaseTauraSyndromeVirus':
//           instance.specificDiseaseTauraSyndromeVirus,
//       'specificDiseaseYellowHeadVirus': instance.specificDiseaseYellowHeadVirus,
//       'specificDiseaseEarlyMortalitySydrome':
//           instance.specificDiseaseEarlyMortalitySydrome,
//       'specificDiseaseVibrioInfections':
//           instance.specificDiseaseVibrioInfections,
//       'specificDiseaseAeromonasInfections':
//           instance.specificDiseaseAeromonasInfections,
//       'specificDiseaseEHP': instance.specificDiseaseEhp,
//       'specificDiseaseFungiAndBacteria':
//           instance.specificDiseaseFungiAndBacteria,
//       'externalBodyCramps': instance.externalBodyCramps,
//       'externalTailRoot': instance.externalTailRoot,
//       'externalVibrio': instance.externalVibrio,
//       'gillsBlackGills': instance.gillsBlackGills,
//       'gillsBrownGills': instance.gillsBrownGills,
//       'hepatopancreasShrinked': instance.hepatopancreasShrinked,
//       'intestineFluids': instance.intestineFluids,
//       'intestineWhiteGut': instance.intestineWhiteGut,
//       'intestineWhiteFecus': instance.intestineWhiteFecus,
//       'muscleTissueWhiteMuscle': instance.muscleTissueWhiteMuscle,
//       'diagnosedProblemAndDisease': instance.diagnosedProblemAndDisease,
//       'tankId': instance.tankId,
//       'testId': instance.testId,
//       'updatedAt': instance.updatedAt,
//       'createdAt': instance.createdAt,
//     };
Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      status: json['status'] as String,
      id: (json['id'] as num).toInt(),
      externalAbnormalColor: json['externalAbnormalColor'] as String,
      externalLesionUclers: json['externalLesionUclers'] as String,
      externalExcessiveMucus: json['externalExcessiveMucus'] as String,
      externalMalformations: json['externalMalformations'] as String,
      gillsDiscoloration: json['gillsDiscoloration'] as String,
      gillsParasites: json['gillsParasites'] as String,
      hepatopancreasDiscoloration:
          json['hepatopancreasDiscoloration'] as String,
      hepatopancreasEnlargement: json['hepatopancreasEnlargement'] as String,
      stomachForeignMaterial: json['stomachForeignMaterial'] as String,
      stomachAbnormalities: json['stomachAbnormalities'] as String,
      reproductiveAbnormalities: json['reproductiveAbnormalities'] as String,
      intestineBlockages: json['intestineBlockages'] as String,
      intestineParasites: json['intestineParasites'] as String,
      muscleTissueDiscoloration: json['muscleTissueDiscoloration'] as String,
      muscleTissueLesions: json['muscleTissueLesions'] as String,
      nervousSystemAbnormalities: json['nervousSystemAbnormalities'] as String,
      generalBehaviorWeeknessOrLethargy:
          json['generalBehaviorWeeknessOrLethargy'] as String,
      generalBehaviorReducedFeeding:
          json['generalBehaviorReducedFeeding'] as String,
      specificDiseaseWhiteSpotSyndromeVirus:
          json['specificDiseaseWhiteSpotSyndromeVirus'] as String,
      specificDiseaseInfectiousHypodermalVirus:
          json['specificDiseaseInfectiousHypodermalVirus'] as String,
      specificDiseaseRunningMortalitySydrome:
          json['specificDiseaseRunningMortalitySydrome'] as String,
      specificDiseaseTauraSyndromeVirus:
          json['specificDiseaseTauraSyndromeVirus'] as String,
      specificDiseaseYellowHeadVirus:
          json['specificDiseaseYellowHeadVirus'] as String,
      specificDiseaseEarlyMortalitySydrome:
          json['specificDiseaseEarlyMortalitySydrome'] as String,
      specificDiseaseVibrioInfections:
          json['specificDiseaseVibrioInfections'] as String,
      specificDiseaseAeromonasInfections:
          json['specificDiseaseAeromonasInfections'] as String,
      specificDiseaseEhp: json['specificDiseaseEHP'] as String,
      specificDiseaseFungiAndBacteria:
          json['specificDiseaseFungiAndBacteria'] as String,
      externalBodyCramps: json['externalBodyCramps'] as String?,
      externalTailRoot: json['externalTailRoot'] as String?,
      externalVibrio: json['externalVibrio'] as String?,
      gillsBlackGills: json['gillsBlackGills'] as String?,
      gillsBrownGills: json['gillsBrownGills'] as String?,
      hepatopancreasShrinked: json['hepatopancreasShrinked'] as String?,
      intestineFluids: json['intestineFluids'] as String?,
      intestineWhiteGut: json['intestineWhiteGut'] as String?,
      intestineWhiteFecus: json['intestineWhiteFecus'] as String?,
      muscleTissueWhiteMuscle: json['muscleTissueWhiteMuscle'] as String?,
      diagnosedProblemAndDisease: json['diagnosedProblemAndDisease'] as String,
      tankId: (json['tankId'] as num).toInt(),
      testId: (json['testId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
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
      'externalBodyCramps': instance.externalBodyCramps,
      'externalTailRoot': instance.externalTailRoot,
      'externalVibrio': instance.externalVibrio,
      'gillsBlackGills': instance.gillsBlackGills,
      'gillsBrownGills': instance.gillsBrownGills,
      'hepatopancreasShrinked': instance.hepatopancreasShrinked,
      'intestineFluids': instance.intestineFluids,
      'intestineWhiteGut': instance.intestineWhiteGut,
      'intestineWhiteFecus': instance.intestineWhiteFecus,
      'muscleTissueWhiteMuscle': instance.muscleTissueWhiteMuscle,
      'diagnosedProblemAndDisease': instance.diagnosedProblemAndDisease,
      'tankId': instance.tankId,
      'testId': instance.testId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
