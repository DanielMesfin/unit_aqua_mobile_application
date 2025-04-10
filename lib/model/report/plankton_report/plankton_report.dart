class ResponseModel {
  final String message;
  final String response;
  final int statusCode;
  final PlanktonReportResponseModel result;

  ResponseModel({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: json['statusCode'] as int,
      result: PlanktonReportResponseModel.fromJson(json['result']),
    );
  }

  Map<String, dynamic> toJson() {
    print(result.toJson());
    return {
      'message': message,
      'RESPONSE': response,
      'statusCode': statusCode,
      'result': result.toJson(),
    };
  }
}

class PlanktonReportResponseModel {
  final int id;
  final int? usefulChlorella;
  final int? usefulOocysts;
  final int? usefulScenedesmus;
  final int? usefulEudorina;
  final int? usefulTetrasolmis;
  final int? usefulEutreptia;
  final int? usefulPhacus;
  final int? usefulSpriulina;
  final int? usefulChaetoceros;
  final int? usefulSkeletonema;
  final int? usefulCyclotella;
  final int? usefulThalassiosira;
  final int? usefulCopepod;
  final int? usefulRotifer;
  final int? usefulNauplius;
  final int? harmfulNoctiluca;
  final int? harmfulCeratium;
  final int? harmfulDinophysis;
  final int? harmfulZoothamnium;
  final int? harmfulFavella;
  final int? harmfulVorticella;
  final int? harmfulGregarina;
  final int? harmfulAnabaena;
  final int? harmfulOscillatoria;
  final int? harmfulMicrocystis;
  final int? harmfulCoscinodiscus;
  final int? harmfulNitzschia;
  final int? harmfulNavicula;
  final int? harmfulPleurosigma;
  final String suggestion;
  final int testId;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int tankId;

  PlanktonReportResponseModel({
    required this.id,
    required this.usefulChlorella,
    required this.usefulOocysts,
    required this.usefulScenedesmus,
    required this.usefulEudorina,
    required this.usefulTetrasolmis,
    required this.usefulEutreptia,
    required this.usefulPhacus,
    required this.usefulSpriulina,
    required this.usefulChaetoceros,
    required this.usefulSkeletonema,
    required this.usefulCyclotella,
    required this.usefulThalassiosira,
    required this.usefulCopepod,
    required this.usefulRotifer,
    required this.usefulNauplius,
    required this.harmfulNoctiluca,
    required this.harmfulCeratium,
    required this.harmfulDinophysis,
    required this.harmfulZoothamnium,
    required this.harmfulFavella,
    required this.harmfulVorticella,
    required this.harmfulGregarina,
    required this.harmfulAnabaena,
    required this.harmfulOscillatoria,
    required this.harmfulMicrocystis,
    required this.harmfulCoscinodiscus,
    required this.harmfulNitzschia,
    required this.harmfulNavicula,
    required this.harmfulPleurosigma,
    required this.suggestion,
    required this.testId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.tankId,
  });

  factory PlanktonReportResponseModel.fromJson(Map<String, dynamic> json) {
    return PlanktonReportResponseModel(
      id: json['id'] as int,
      usefulChlorella: json['useful_Chlorella'] as int?,
      usefulOocysts: json['useful_Oocysts'] as int?,
      usefulScenedesmus: json['useful_Scenedesmus'] as int?,
      usefulEudorina: json['useful_Eudorina'] as int?,
      usefulTetrasolmis: json['useful_Tetrasolmis'] as int?,
      usefulEutreptia: json['useful_Eutreptia'] as int?,
      usefulPhacus: json['useful_Phacus'] as int?,
      usefulSpriulina: json['useful_Spriulina'] as int?,
      usefulChaetoceros: json['useful_Chaetoceros'] as int?,
      usefulSkeletonema: json['useful_Skeletonema'] as int?,
      usefulCyclotella: json['useful_Cyclotella'] as int?,
      usefulThalassiosira: json['useful_Thalassiosira'] as int?,
      usefulCopepod: json['useful_Copepod'] as int?,
      usefulRotifer: json['useful_Rotifer'] as int?,
      usefulNauplius: json['useful_Nauplius'] as int?,
      harmfulNoctiluca: json['harmful_Noctiluca'] as int?,
      harmfulCeratium: json['harmful_Ceratium'] as int?,
      harmfulDinophysis: json['harmful_Dinophysis'] as int?,
      harmfulZoothamnium: json['harmful_Zoothamnium'] as int?,
      harmfulFavella: json['harmful_Favella'] as int?,
      harmfulVorticella: json['harmful_Vorticella'] as int?,
      harmfulGregarina: json['harmful_Gregarina'] as int?,
      harmfulAnabaena: json['harmful_Anabaena'] as int?,
      harmfulOscillatoria: json['harmful_Oscillatoria'] as int?,
      harmfulMicrocystis: json['harmful_Microcystis'] as int?,
      harmfulCoscinodiscus: json['harmful_Coscinodiscus'] as int?,
      harmfulNitzschia: json['harmful_Nitzschia'] as int?,
      harmfulNavicula: json['harmful_Navicula'] as int?,
      harmfulPleurosigma: json['harmful_Pleurosigma'] as int?,
      suggestion: json['suggestion'] as String,
      testId: json['testId'] as int,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      tankId: json['tankId'] as int,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     // 'id': id,
  //     'useful_Chlorella': usefulChlorella ?? '-',
  //     'useful_Oocysts': usefulOocysts ?? '-',
  //     'useful_Scenedesmus': usefulScenedesmus ?? '-',
  //     'useful_Eudorina': usefulEudorina ?? '-',
  //     'useful_Tetrasolmis': usefulTetrasolmis ?? '-',
  //     'useful_Eutreptia': usefulEutreptia ?? '-',
  //     'useful_Phacus': usefulPhacus ?? '-',
  //     'useful_Spriulina': usefulSpriulina ?? '-',
  //     'useful_Chaetoceros': usefulChaetoceros ?? '-',
  //     'useful_Skeletonema': usefulSkeletonema ?? '-',
  //     'useful_Cyclotella': usefulCyclotella ?? '-',
  //     'useful_Thalassiosira': usefulThalassiosira ?? '-',
  //     'useful_Copepod': usefulCopepod ?? '-',
  //     'useful_Rotifer': usefulRotifer ?? '-',
  //     'useful_Nauplius': usefulNauplius ?? '-',
  //     'harmful_Noctiluca': harmfulNoctiluca ?? '-',
  //     'harmful_Ceratium': harmfulCeratium ?? '-',
  //     'harmful_Dinophysis': harmfulDinophysis ?? '-',
  //     'harmful_Zoothamnium': harmfulZoothamnium ?? '-',
  //     'harmful_Favella': harmfulFavella ?? '-',
  //     'harmful_Vorticella': harmfulVorticella ?? '-',
  //     'harmful_Gregarina': harmfulGregarina ?? '-',
  //     'harmful_Anabaena': harmfulAnabaena ?? '-',
  //     'harmful_Oscillatoria': harmfulOscillatoria ?? '-',
  //     'harmful_Microcystis': harmfulMicrocystis ?? '-',
  //     'harmful_Coscinodiscus': harmfulCoscinodiscus ?? '-',
  //     'harmful_Nitzschia': harmfulNitzschia ?? '-',
  //     'harmful_Navicula': harmfulNavicula ?? '-',
  //     'harmful_Pleurosigma': harmfulPleurosigma ?? '-',
  //     'suggestion': suggestion,
  //   };
  // }
  Map<String, dynamic> toJson() {
    String intToStars(int? value) {
      // return value != null && value > 0 ? '⭐' * value : '-';
      return value != null && value > 0 ? '*' * value : '-';
    }

    return {
      'useful_Chlorella': intToStars(usefulChlorella),
      'useful_Oocysts': intToStars(usefulOocysts),
      'useful_Scenedesmus': intToStars(usefulScenedesmus),
      'useful_Eudorina': intToStars(usefulEudorina),
      'useful_Tetrasolmis': intToStars(usefulTetrasolmis),
      'useful_Eutreptia': intToStars(usefulEutreptia),
      'useful_Phacus': intToStars(usefulPhacus),
      'useful_Spriulina': intToStars(usefulSpriulina),
      'useful_Chaetoceros': intToStars(usefulChaetoceros),
      'useful_Skeletonema': intToStars(usefulSkeletonema),
      'useful_Cyclotella': intToStars(usefulCyclotella),
      'useful_Thalassiosira': intToStars(usefulThalassiosira),
      'useful_Copepod': intToStars(usefulCopepod),
      'useful_Rotifer': intToStars(usefulRotifer),
      'useful_Nauplius': intToStars(usefulNauplius),
      'harmful_Noctiluca': intToStars(harmfulNoctiluca),
      'harmful_Ceratium': intToStars(harmfulCeratium),
      'harmful_Dinophysis': intToStars(harmfulDinophysis),
      'harmful_Zoothamnium': intToStars(harmfulZoothamnium),
      'harmful_Favella': intToStars(harmfulFavella),
      'harmful_Vorticella': intToStars(harmfulVorticella),
      'harmful_Gregarina': intToStars(harmfulGregarina),
      'harmful_Anabaena': intToStars(harmfulAnabaena),
      'harmful_Oscillatoria': intToStars(harmfulOscillatoria),
      'harmful_Microcystis': intToStars(harmfulMicrocystis),
      'harmful_Coscinodiscus': intToStars(harmfulCoscinodiscus),
      'harmful_Nitzschia': intToStars(harmfulNitzschia),
      'harmful_Navicula': intToStars(harmfulNavicula),
      'harmful_Pleurosigma': intToStars(harmfulPleurosigma),
      'suggestion': suggestion,
    };
  }
}
