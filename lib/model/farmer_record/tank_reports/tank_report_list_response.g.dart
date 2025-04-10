// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_report_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TankReportListResponse _$TankReportListResponseFromJson(
        Map<String, dynamic> json) =>
    TankReportListResponse(
      message: json['message'] as String?,
      response: json['RESPONSE'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TankReportListResponseToJson(
        TankReportListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      water: (json['water'] as List<dynamic>?)
          ?.map((e) => Water.fromJson(e as Map<String, dynamic>))
          .toList(),
      fish: (json['fish'] as List<dynamic>?)
          ?.map((e) => Fish.fromJson(e as Map<String, dynamic>))
          .toList(),
      shrimp: (json['shrimp'] as List<dynamic>?)
          ?.map((e) => Shrimp.fromJson(e as Map<String, dynamic>))
          .toList(),
      soil: (json['soil'] as List<dynamic>?)
          ?.map((e) => Soil.fromJson(e as Map<String, dynamic>))
          .toList(),
      pcr: (json['pcr'] as List<dynamic>?)
          ?.map((e) => Culture.fromJson(e as Map<String, dynamic>))
          .toList(),
      feed: (json['feed'] as List<dynamic>?)
          ?.map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
      culture: (json['culture'] as List<dynamic>?)
          ?.map((e) => Culture.fromJson(e as Map<String, dynamic>))
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

Culture _$CultureFromJson(Map<String, dynamic> json) => Culture(
      id: (json['id'] as num?)?.toInt(),
      yellowColonies: (json['yellowColonies'] as num?)?.toInt(),
      greenColonies: (json['greenColonies'] as num?)?.toInt(),
      testId: (json['testId'] as num?)?.toInt(),
      suggestion: json['suggestion'] as String?,
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
      pcr: json['pcr'] as String?,
    );

Map<String, dynamic> _$CultureToJson(Culture instance) => <String, dynamic>{
      'id': instance.id,
      'yellowColonies': instance.yellowColonies,
      'greenColonies': instance.greenColonies,
      'testId': instance.testId,
      'suggestion': instance.suggestion,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
      'alltest': instance.alltest,
      'tank': instance.tank,
      'pcr': instance.pcr,
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

Feed _$FeedFromJson(Map<String, dynamic> json) => Feed(
      id: (json['id'] as num?)?.toInt(),
      fat: json['fat'] as String?,
      protein: json['protein'] as String?,
      moisture: json['moisture'] as String?,
      ash: json['ash'] as String?,
      fiber: json['fiber'] as String?,
      testId: (json['testId'] as num?)?.toInt(),
      suggestion: json['suggestion'] as String?,
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

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'fat': instance.fat,
      'protein': instance.protein,
      'moisture': instance.moisture,
      'ash': instance.ash,
      'fiber': instance.fiber,
      'testId': instance.testId,
      'suggestion': instance.suggestion,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
      'alltest': instance.alltest,
      'tank': instance.tank,
    };

Fish _$FishFromJson(Map<String, dynamic> json) => Fish(
      id: (json['id'] as num?)?.toInt(),
      fishDetails: json['fishDetails'] as String?,
      bodyColour: json['bodyColour'] as String?,
      bodyTexture: json['bodyTexture'] as String?,
      mucus: json['mucus'] as String?,
      eyes: json['eyes'] as String?,
      finsColour: json['finsColour'] as String?,
      gills: json['gills'] as String?,
      intestines: json['intestines'] as String?,
      internalBloodLumps: json['internalBloodLumps'] as String?,
      liver: json['liver'] as String?,
      gut: json['gut'] as String?,
      gallBladder: json['gallBladder'] as String?,
      redDisease: json['redDisease'] as String?,
      ulcerativeDropsy: json['ulcerativeDropsy'] as String?,
      abdominalDropsy: json['abdominalDropsy'] as String?,
      bodyColumnaris: json['bodyColumnaris'] as String?,
      gillColumnaris: json['gillColumnaris'] as String?,
      epizooticUlcerativeSyndrome:
          json['epizooticUlcerativeSyndrome'] as String?,
      dactylogyrus: json['dactylogyrus'] as String?,
      gyrodactylus: json['gyrodactylus'] as String?,
      trichodina: json['trichodina'] as String?,
      myxobolus: json['myxobolus'] as String?,
      anchorWormOrLernaea: json['anchorWormORLernaea'] as String?,
      argulus: json['argulus'] as String?,
      finRotOrTailrot: json['finRotORTailrot'] as String?,
      hemorrhagicSepticemia: json['hemorrhagicSepticemia'] as String?,
      diagnosedProblemAndDisease: json['diagnosedProblemAndDisease'] as String?,
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

Map<String, dynamic> _$FishToJson(Fish instance) => <String, dynamic>{
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
      'suggestion': instance.suggestion,
      'testId': instance.testId,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
      'alltest': instance.alltest,
      'tank': instance.tank,
    };

Shrimp _$ShrimpFromJson(Map<String, dynamic> json) => Shrimp(
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

Map<String, dynamic> _$ShrimpToJson(Shrimp instance) => <String, dynamic>{
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

Soil _$SoilFromJson(Map<String, dynamic> json) => Soil(
      id: (json['id'] as num?)?.toInt(),
      soilType: json['soilType'] as String?,
      soilNature: json['soilNature'] as String?,
      soilPh: json['soilPh'] as String?,
      organicCarbon: json['organicCarbon'] as String?,
      availableNitrogen: json['availableNitrogen'] as String?,
      prosperous: json['prosperous'] as String?,
      potash: json['potash'] as String?,
      sulphur: json['sulphur'] as String?,
      zinc: json['zinc'] as String?,
      iron: json['iron'] as String?,
      boran: json['boran'] as String?,
      limeTest: json['limeTest'] as String?,
      observationType: json['observationType'] as String?,
      observation: json['observation'] as String?,
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

Map<String, dynamic> _$SoilToJson(Soil instance) => <String, dynamic>{
      'id': instance.id,
      'soilType': instance.soilType,
      'soilNature': instance.soilNature,
      'soilPh': instance.soilPh,
      'organicCarbon': instance.organicCarbon,
      'availableNitrogen': instance.availableNitrogen,
      'prosperous': instance.prosperous,
      'potash': instance.potash,
      'sulphur': instance.sulphur,
      'zinc': instance.zinc,
      'iron': instance.iron,
      'boran': instance.boran,
      'limeTest': instance.limeTest,
      'observationType': instance.observationType,
      'observation': instance.observation,
      'suggestion': instance.suggestion,
      'testId': instance.testId,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
      'alltest': instance.alltest,
      'tank': instance.tank,
    };

Water _$WaterFromJson(Map<String, dynamic> json) => Water(
      id: (json['id'] as num?)?.toInt(),
      ph: json['ph'],
      temprature: json['temprature'],
      salinity: json['salinity'],
      co3: json['co3'],
      hco3: json['hco3'],
      totalAlkanility: json['totalAlkanility'],
      totalHardness: json['totalHardness'],
      ca: json['ca'],
      mg: json['mg'],
      k: json['k'],
      fe: json['fe'],
      na: json['na'],
      cl2: json['cl2'],
      tan: json['tan'],
      nh3: json['nh3'],
      no2: json['no2'],
      h2S: json['h2s'],
      co2: json['co2'],
      dissolvedOxygen: json['dissolvedOxygen'],
      electricalConductivity: json['electricalConductivity'],
      totalDissolvedSolids: json['totalDissolvedSolids'],
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

Map<String, dynamic> _$WaterToJson(Water instance) => <String, dynamic>{
      'id': instance.id,
      'ph': instance.ph,
      'temprature': instance.temprature,
      'salinity': instance.salinity,
      'co3': instance.co3,
      'hco3': instance.hco3,
      'totalAlkanility': instance.totalAlkanility,
      'totalHardness': instance.totalHardness,
      'ca': instance.ca,
      'mg': instance.mg,
      'k': instance.k,
      'fe': instance.fe,
      'na': instance.na,
      'cl2': instance.cl2,
      'tan': instance.tan,
      'nh3': instance.nh3,
      'no2': instance.no2,
      'h2s': instance.h2S,
      'co2': instance.co2,
      'dissolvedOxygen': instance.dissolvedOxygen,
      'electricalConductivity': instance.electricalConductivity,
      'totalDissolvedSolids': instance.totalDissolvedSolids,
      'suggestion': instance.suggestion,
      'testId': instance.testId,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tankId': instance.tankId,
      'alltest': instance.alltest,
      'tank': instance.tank,
    };
