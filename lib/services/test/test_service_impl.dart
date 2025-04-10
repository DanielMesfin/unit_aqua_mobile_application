import 'package:get/get.dart';
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
import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';
import 'test_service.dart';

class TestServiceImpl extends TestServices {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  @override
  Future<CreateTest> createTest({
    required type,
    required weight,
    required depth,
    required biomass,
    required planktonTest,
    required tankId,
    required user_id,
    required farmerid,
  }) async {
    final response = await _httpService.postRequest(
      data: {
        "type": type,
        "weight": weight,
        "depth": depth,
        "biomass": biomass,
        'planktonTest': planktonTest,
        "tankId": tankId,
        "user_id": user_id
      },
      urlPath: '${Apis.createTest}/$farmerid',
      //headerType: HeaderType.secured,
    );
    final parsedResponse = CreateTest.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<TestPending> pendingTests({required userId}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.pendingTests}/$userId',
      //data: {"search": search},
      headerType: HeaderType.secured,
    );
    final parsedResponse = TestPending.fromJson(response.data);
    return parsedResponse;
  }

  //delete pending
  @override
  Future<TestPending> deleteTest({required String testId}) async {
    final response = await _httpService.deleteRequest(
      data: {},
      urlPath: '${Apis.test}/$testId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = TestPending.fromJson(response.data);
    return parsedResponse;
  }

  //water create
  @override
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
  }) async {
    final response = await _httpService.postRequest(
      data: {
        "ph": ph,
        "temprature": temprature,
        "salinity": salinity,
        "co3": co3,
        "hco3": hco3,
        "totalAlkanility": totalAlkanility,
        "totalHardness": totalHardness,
        "ca": ca,
        "mg": mg,
        "k": k,
        "fe": fe,
        "na": na,
        "cl2": cl2,
        "tan": tan,
        "nh3": nh3,
        "no2": no2,
        "h2s": h2s,
        "co2": co2,
        "dissolvedOxygen": dissolvedOxygen,
        "electricalConductivity": electricalConductivity,
        "totalDissolvedSolids": totalDissolvedSolids,
        "tankId": tankId,
        "testId": testId,
      },
      urlPath: Apis.water,
      //headerType: HeaderType.secured,
    );
    final parsedResponse = WaterTestFormResponse.fromJson(response.data);
    return parsedResponse;
  }

// Create feedCreateTest method
  @override
  Future<FeedTestFormResponse> feedCreateTest({
    required fat,
    required protein,
    required moisture,
    required ash,
    required fiber,
    required tankId,
    required testId,
  }) async {
    final response = await _httpService.postRequest(
      data: {
        "fat": fat,
        "protein": protein,
        "moisture": moisture,
        "ash": ash,
        "fiber": fiber,
        "tankId": tankId,
        "testId": testId,
      },
      urlPath: Apis.feed,
      //headerType: HeaderType.secured,
    );
    final parsedResponse = FeedTestFormResponse.fromJson(response.data);
    return parsedResponse;
  }

// Create soilCreateTest method
  @override
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
  }) async {
    final response = await _httpService.postRequest(
      data: {
        "soilType": soilType,
        "soilNature": soilNature,
        "soilPh": soilPh,
        "organicCarbon": organicCarbon,
        "availableNitrogen": availableNitrogen,
        "prosperous": prosperous,
        "potash": potash,
        "sulphur": sulphur,
        "zinc": zinc,
        "iron": iron,
        "boran": boran,
        "limeTest": limeTest,
        "tankId": tankId,
        "testId": testId,
      },
      urlPath: Apis.soil,
      //headerType: HeaderType.secured,
    );
    final parsedResponse = SoilTestFormResponse.fromJson(response.data);
    return parsedResponse;
  }

// Create shrimpCreateTest method
  @override
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
  }) async {
    final response = await _httpService.postRequest(
      data: {
        "externalAbnormalColor": externalAbnormalColor,
        "externalLesionUclers": externalLesionUclers,
        "externalExcessiveMucus": externalExcessiveMucus,
        "externalMalformations": externalMalformations,
        "gillsDiscoloration": gillsDiscoloration,
        "gillsParasites": gillsParasites,
        "hepatopancreasDiscoloration": hepatopancreasDiscoloration,
        "hepatopancreasEnlargement": hepatopancreasEnlargement,
        "stomachForeignMaterial": stomachForeignMaterial,
        "stomachAbnormalities": stomachAbnormalities,
        "reproductiveAbnormalities": reproductiveAbnormalities,
        "intestineBlockages": intestineBlockages,
        "intestineParasites": intestineParasites,
        "muscleTissueDiscoloration": muscleTissueDiscoloration,
        "muscleTissueLesions": muscleTissueLesions,
        "nervousSystemAbnormalities": nervousSystemAbnormalities,
        "generalBehaviorWeeknessOrLethargy": generalBehaviorWeeknessOrLethargy,
        "generalBehaviorReducedFeeding": generalBehaviorReducedFeeding,
        "specificDiseaseWhiteSpotSyndromeVirus":
            specificDiseaseWhiteSpotSyndromeVirus,
        "specificDiseaseInfectiousHypodermalVirus":
            specificDiseaseInfectiousHypodermalVirus,
        "specificDiseaseRunningMortalitySydrome":
            specificDiseaseRunningMortalitySydrome,
        "specificDiseaseTauraSyndromeVirus": specificDiseaseTauraSyndromeVirus,
        "specificDiseaseYellowHeadVirus": specificDiseaseYellowHeadVirus,
        "specificDiseaseEarlyMortalitySydrome":
            specificDiseaseEarlyMortalitySydrome,
        "specificDiseaseVibrioInfections": specificDiseaseVibrioInfections,
        "specificDiseaseAeromonasInfections":
            specificDiseaseAeromonasInfections,
        "specificDiseaseEHP": specificDiseaseEHP,
        "specificDiseaseFungiAndBacteria": specificDiseaseFungiAndBacteria,
        "externalBodyCramps": externalBodyCramps,
        "externalTailRoot": externalTailRoot,
        "externalVibrio": externalVibrio,
        "gillsBlackGills": gillsBlackGills,
        "gillsBrownGills": gillsBrownGills,
        "hepatopancreasShrinked": hepatopancreasShrinked,
        "intestineFluids": intestineFluids,
        "intestineWhiteGut": intestineWhiteGut,
        "intestineWhiteFecus": intestineWhiteFecus,
        "muscleTissueWhiteMuscle": muscleTissueWhiteMuscle,
        "diagnosedProblemAndDisease": diagnosedProblemAndDisease,
        "tankId": tankId,
        "testId": testId,
      },
      urlPath: Apis.shrimp,
      //headerType: HeaderType.secured,
    );
    final parsedResponse = ShrimpTestFormResponse.fromJson(response.data);
    return parsedResponse;
  }

// Create fishCreateTest method
  @override
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
  }) async {
    final response = await _httpService.postRequest(
      data: {
        "fishDetails": fishDetails,
        "bodyColour": bodyColour,
        "bodyTexture": bodyTexture,
        "mucus": mucus,
        "eyes": eyes,
        "finsColour": finsColour,
        "gills": gills,
        "intestines": intestines,
        "internalBloodLumps": internalBloodLumps,
        "liver": liver,
        "gut": gut,
        "gallBladder": gallBladder,
        "redDisease": redDisease,
        "ulcerativeDropsy": ulcerativeDropsy,
        "abdominalDropsy": abdominalDropsy,
        "bodyColumnaris": bodyColumnaris,
        "gillColumnaris": gillColumnaris,
        "epizooticUlcerativeSyndrome": epizooticUlcerativeSyndrome,
        "dactylogyrus": dactylogyrus,
        "gyrodactylus": gyrodactylus,
        "trichodina": trichodina,
        "myxobolus": myxobolus,
        "anchorWormORLernaea": anchorWormORLernaea,
        "argulus": argulus,
        "finRotORTailrot": finRotORTailrot,
        "hemorrhagicSepticemia": hemorrhagicSepticemia,
        "redMouth": redMouth,
        "bactirialGillRoo": bactirialGillRoot,
        "eggOrRoeInfection": eggORRoleInfection,
        "ichthyphthirius": ichthyophthirius,
        "fungalInfection": fungalInfection,
        "diagnosedProblemAndDisease": diagnosedProblemAndDisease,
        "tankId": tankId,
        "testId": testId,
      },
      urlPath: Apis.fish,
      //headerType: HeaderType.secured,
    );
    final parsedResponse = FishTestFormResponse.fromJson(response.data);
    return parsedResponse;
  }

  // Create PCRCreate method
  @override
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
  }) async {
    final response = await _httpService.postRequest(
      data: {
        "tankId": tankId,
        "testId": testId,
        "whiteSpotResult": whiteSpotResult,
        "whiteSpotCtValue": whiteSpotCtValue,
        "enterocytozoonResult": enterocytozoonResult,
        "enterocytozoonCtValue": enterocytozoonCtValue,
        "ihhnvResult": ihhnvResult,
        "ihhnvCtValue": ihhnvCtValue,
        "emsResult": emsResult,
        "emsCtValue": emsCtValue,
        "imnvResult": imnvResult,
        "imnvCtValue": imnvCtValue,
        "vHarveyResult": vHarveyResult,
        "vHarveyCtValue": vHarveyCtValue,
        "vParahaemolyticusResult": vParahaemolyticusResult,
        "vParahaemolyticusCtValue": vParahaemolyticusCtValue,
        "remarkText": remarkText,
      },
      urlPath: Apis.pcr,
      //headerType: HeaderType.secured,
    );
    final parsedResponse = PcrTestFormResponse.fromJson(response.data);
    return parsedResponse;
  }

  // Culture PCRCreate method
  @override
  Future<CultureTestFormResponse> cultureCreateTest({
    required yellowColonies,
    required greenColonies,
    required tankId,
    required testId,
  }) async {
    final response = await _httpService.postRequest(
      data: {
        "yellowColonies": yellowColonies,
        "greenColonies": greenColonies,
        "tankId": tankId,
        "testId": testId,
      },
      urlPath: Apis.culture,
      //headerType: HeaderType.secured,
    );
    final parsedResponse = CultureTestFormResponse.fromJson(response.data);
    return parsedResponse;
  }

  // Plankton Create method
  @override
  Future<PlanktonTestFormResponse> planktonCreateTest(
      {required PlanktonTestFormModel planktonform}) async {
    final response = await _httpService.postRequest(
      data: planktonform.toJson(),
      urlPath: Apis.plankton,
      headerType: HeaderType.secured,
    );
    final parsedResponse = PlanktonTestFormResponse.fromJson(response.data);
    return parsedResponse;
  }
}
