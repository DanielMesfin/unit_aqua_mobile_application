class MarketType {
  int id;
  String uuid;
  String name;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int marketZoneId;

  MarketType({
    required this.id,
    required this.uuid,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.marketZoneId,
  });

  factory MarketType.fromJson(Map<String, dynamic> json) {
    return MarketType(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      status: int.parse(json['status']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      marketZoneId: json['marketZoneId'],
    );
  }
}

class MarketTypeData {
  int id;
  int count;
  dynamic rate;
  DateTime createdAt;
  DateTime updatedAt;
  int marketTypeId;
  MarketType marketType;

  MarketTypeData({
    required this.id,
    required this.count,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
    required this.marketTypeId,
    required this.marketType,
  });

  factory MarketTypeData.fromJson(Map<String, dynamic> json) {
    String formatNumber(double number) {
      // Convert the number to a string
      String numberStr = number.toString();

      // Check if the number contains a decimal point
      if (numberStr.contains('.')) {
        // Remove trailing zeros after the decimal point
        numberStr = numberStr.replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '');
      }

      return numberStr;
    }

    return MarketTypeData(
      id: json['id'],
      count: int.parse(json['count']),
      rate: formatNumber(json['rate'].toDouble()),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      marketTypeId: json['marketTypeId'],
      marketType: MarketType.fromJson(json['market_type']),
    );
  }
}

class MarketApiResponse {
  String message;
  String response;
  int statusCode;
  List<MarketTypeData> result;

  MarketApiResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory MarketApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['result'] as List;
    List<MarketTypeData> resultList =
        list.map((i) => MarketTypeData.fromJson(i)).toList();

    return MarketApiResponse(
      message: json['message'],
      response: json['RESPONSE'],
      statusCode: json['statusCode'],
      result: resultList,
    );
  }
}
