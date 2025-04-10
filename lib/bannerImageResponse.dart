import 'dart:convert';

class BannerResponse {
  final int bannerId;
  final String imageUrl;
  final String message;

  BannerResponse({
    required this.bannerId,
    required this.imageUrl,
    required this.message,
  });

  // Factory method to create a BannerResponse object from JSON
  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    return BannerResponse(
      bannerId: json['bannerId'],
      imageUrl: json['imageUrl'],
      message: json['message'] ?? 'Banner updated successfully',
    );
  }

  // Method to convert the BannerResponse object back to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'bannerId': bannerId,
      'imageUrl': imageUrl,
      'message': message,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
