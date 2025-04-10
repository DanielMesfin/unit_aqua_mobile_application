// To parse this JSON data, do
//
//     final planktonTestFormModel = planktonTestFormModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'plankton_test_form_model.g.dart';

PlanktonTestFormModel planktonTestFormModelFromJson(String str) => PlanktonTestFormModel.fromJson(json.decode(str));

String planktonTestFormModelToJson(PlanktonTestFormModel data) => json.encode(data.toJson());

@JsonSerializable()
class PlanktonTestFormModel {
    @JsonKey(name: "useful_Chlorella")
    double? usefulChlorella;
    @JsonKey(name: "useful_Oocysts")
    double? usefulOocysts;
    @JsonKey(name: "useful_Scenedesmus")
    double? usefulScenedesmus;
    @JsonKey(name: "useful_Eudorina")
    double? usefulEudorina;
    @JsonKey(name: "useful_Tetrasolmis")
    double? usefulTetrasolmis;
    @JsonKey(name: "useful_Eutreptia")
    double? usefulEutreptia;
    @JsonKey(name: "useful_Phacus")
    double? usefulPhacus;
    @JsonKey(name: "useful_Spriulina")
    double? usefulSpriulina;
    @JsonKey(name: "useful_Chaetoceros")
    double? usefulChaetoceros;
    @JsonKey(name: "useful_Skeletonema")
    double? usefulSkeletonema;
    @JsonKey(name: "useful_Cyclotella")
    double? usefulCyclotella;
    @JsonKey(name: "useful_Thalassiosira")
    double? usefulThalassiosira;
    @JsonKey(name: "useful_Copepod")
    double? usefulCopepod;
    @JsonKey(name: "useful_Rotifer")
    double? usefulRotifer;
    @JsonKey(name: "useful_Nauplius")
    double? usefulNauplius;
    @JsonKey(name: "harmful_Noctiluca")
    double? harmfulNoctiluca;
    @JsonKey(name: "harmful_Ceratium")
    double? harmfulCeratium;
    @JsonKey(name: "harmful_Dinophysis")
    double? harmfulDinophysis;
    @JsonKey(name: "harmful_Zoothamnium")
    double? harmfulZoothamnium;
    @JsonKey(name: "harmful_Favella")
    double? harmfulFavella;
    @JsonKey(name: "harmful_Vorticella")
    double? harmfulVorticella;
    @JsonKey(name: "harmful_Gregarina")
    double? harmfulGregarina;
    @JsonKey(name: "harmful_Anabaena")
    double? harmfulAnabaena;
    @JsonKey(name: "harmful_Oscillatoria")
    double? harmfulOscillatoria;
    @JsonKey(name: "harmful_Microcystis")
    double? harmfulMicrocystis;
    @JsonKey(name: "harmful_Coscinodiscus")
    double? harmfulCoscinodiscus;
    @JsonKey(name: "harmful_Nitzschia")
    double? harmfulNitzschia;
    @JsonKey(name: "harmful_Navicula")
    double? harmfulNavicula;
    @JsonKey(name: "harmful_Pleurosigma")
    double? harmfulPleurosigma;
    @JsonKey(name: "tankId")
    int? tankId;
    @JsonKey(name: "testId")
    int? testId;

    PlanktonTestFormModel({
        this.usefulChlorella,
        this.usefulOocysts,
        this.usefulScenedesmus,
        this.usefulEudorina,
        this.usefulTetrasolmis,
        this.usefulEutreptia,
        this.usefulPhacus,
        this.usefulSpriulina,
        this.usefulChaetoceros,
        this.usefulSkeletonema,
        this.usefulCyclotella,
        this.usefulThalassiosira,
        this.usefulCopepod,
        this.usefulRotifer,
        this.usefulNauplius,
        this.harmfulNoctiluca,
        this.harmfulCeratium,
        this.harmfulDinophysis,
        this.harmfulZoothamnium,
        this.harmfulFavella,
        this.harmfulVorticella,
        this.harmfulGregarina,
        this.harmfulAnabaena,
        this.harmfulOscillatoria,
        this.harmfulMicrocystis,
        this.harmfulCoscinodiscus,
        this.harmfulNitzschia,
        this.harmfulNavicula,
        this.harmfulPleurosigma,
        this.tankId,
        this.testId,
    });

    factory PlanktonTestFormModel.fromJson(Map<String, dynamic> json) => _$PlanktonTestFormModelFromJson(json);

    Map<String, dynamic> toJson() => _$PlanktonTestFormModelToJson(this);
}
