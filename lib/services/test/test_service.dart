import '../../model/test/create_test/create_test.dart';
import '../../model/test/culture_test_form/culture_test_form_response.dart';
import '../../model/test/feed_test_form/feed_test_form_response.dart';
import '../../model/test/fish_test_form/fish_test_form_response.dart';
import '../../model/test/pcr_test_form/pcr_test_form_response.dart';
import '../../model/test/plankton_test_form/plankton_test_form_model.dart';
import '../../model/test/shrimp_test_form/shrimp_test_form_response.dart';
import '../../model/test/soil_test_form/soil_test_form_response.dart';
import '../../model/test/test_pending/test_pending.dart';
import '../../model/test/water_test_form/water_test_form_response.dart';
import '../../model/test/plankton_test_form/plankton_test_form_response.dart';

abstract class TestServices {
  Future<CreateTest> createTest({
    required type,
    required weight,
    required depth,
    required biomass,
    required planktonTest,
    required tankId,
    required user_id,
    required farmerid,
  });
  Future<TestPending> pendingTests({required int userId});
  Future<TestPending> deleteTest({required String testId});

  Future<WaterTestFormResponse> waterCreateTest({
    required ph,
    required temprature,
    required salinity,
    required co3,
    required hco3,
    required totalAlkanility,
    required totalHardness,
    required ca,
    required mg,
    required k,
    required fe,
    required na,
    required cl2,
    required tan,
    required nh3,
    required no2,
    required h2s,
    required co2,
    required dissolvedOxygen,
    required electricalConductivity,
    required totalDissolvedSolids,
    required tankId,
    required testId,
  });

  Future<FeedTestFormResponse> feedCreateTest({
    required fat,
    required protein,
    required moisture,
    required ash,
    required fiber,
    required tankId,
    required testId,
  });
  Future<SoilTestFormResponse> soilCreateTest({
    required soilType,
    required soilNature,
    required soilPh,
    required organicCarbon,
    required availableNitrogen,
    required prosperous,
    required potash,
    required sulphur,
    required zinc,
    required iron,
    required boran,
    required limeTest,
    required tankId,
    required testId,
  });
  Future<ShrimpTestFormResponse> shrimpCreateTest({
    required externalAbnormalColor,
    required externalLesionUclers,
    required externalExcessiveMucus,
    required externalMalformations,
    required gillsDiscoloration,
    required gillsParasites,
    required hepatopancreasDiscoloration,
    required hepatopancreasEnlargement,
    required stomachForeignMaterial,
    required stomachAbnormalities,
    required reproductiveAbnormalities,
    required intestineBlockages,
    required intestineParasites,
    required muscleTissueDiscoloration,
    required muscleTissueLesions,
    required nervousSystemAbnormalities,
    required generalBehaviorWeeknessOrLethargy,
    required generalBehaviorReducedFeeding,
    required specificDiseaseWhiteSpotSyndromeVirus,
    required specificDiseaseInfectiousHypodermalVirus,
    required specificDiseaseRunningMortalitySydrome,
    required specificDiseaseTauraSyndromeVirus,
    required specificDiseaseYellowHeadVirus,
    required specificDiseaseEarlyMortalitySydrome,
    required specificDiseaseVibrioInfections,
    required specificDiseaseAeromonasInfections,
    required specificDiseaseEHP,
    required specificDiseaseFungiAndBacteria,
    externalBodyCramps,
    externalTailRoot,
    externalVibrio,
    gillsBlackGills,
    gillsBrownGills,
    hepatopancreasShrinked,
    intestineFluids,
    intestineWhiteGut,
    intestineWhiteFecus,
    muscleTissueWhiteMuscle,
    required diagnosedProblemAndDisease,
    required tankId,
    required testId,
  });
  Future<FishTestFormResponse> fishCreateTest({
    required fishDetails,
    required bodyColour,
    required bodyTexture,
    required mucus,
    required eyes,
    required finsColour,
    required gills,
    required intestines,
    required internalBloodLumps,
    required liver,
    required gut,
    required gallBladder,
    required redDisease,
    required ulcerativeDropsy,
    required abdominalDropsy,
    required bodyColumnaris,
    required gillColumnaris,
    required epizooticUlcerativeSyndrome,
    required dactylogyrus,
    required gyrodactylus,
    required trichodina,
    required myxobolus,
    required anchorWormORLernaea,
    required argulus,
    required finRotORTailrot,
    required hemorrhagicSepticemia,
    required redMouth,
    required bactirialGillRoot,
    required eggORRoleInfection,
    required ichthyophthirius,
    required fungalInfection,
    required diagnosedProblemAndDisease,
    required tankId,
    required testId,
  });

  Future<PcrTestFormResponse> pcrCreateTest({
    required tankId,
    required testId,
    required whiteSpotResult,
    required whiteSpotCtValue,
    required enterocytozoonResult,
    required enterocytozoonCtValue,
    required ihhnvResult,
    required ihhnvCtValue,
    required emsResult,
    required emsCtValue,
    required imnvResult,
    required imnvCtValue,
    required vHarveyResult,
    required vHarveyCtValue,
    required vParahaemolyticusResult,
    required vParahaemolyticusCtValue,
    required remarkText,
  });

  Future<CultureTestFormResponse> cultureCreateTest({
    required yellowColonies,
    required greenColonies,
    required tankId,
    required testId,
  });
  Future<PlanktonTestFormResponse> planktonCreateTest(
      {required PlanktonTestFormModel planktonform});
}
