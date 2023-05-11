// To parse this JSON data, do
//
//     final winLeveLPoints = winLeveLPointsFromJson(jsonString);

import 'dart:convert';

WinLeveLPoints winLeveLPointsFromJson(String str) => WinLeveLPoints.fromJson(json.decode(str));

String winLeveLPointsToJson(WinLeveLPoints data) => json.encode(data.toJson());

class WinLeveLPoints {

  int? winLevel;
  int? pointsWon;
  String? message;
  int? responseCode;
  WinLeveLPoints({
    this.winLevel,
    this.pointsWon,
    this.message,
    this.responseCode,
  });

  WinLeveLPoints.fromJson(Map<String, dynamic> json){
    winLevel= json["win_level"]??0;
    pointsWon= json["points_won"]??0;
    message= json["message"];
    responseCode= json["response_code"];
  }



  // factory WinLeveLPoints.fromJson1(Map<String, dynamic> json) => WinLeveLPoints(
  //   winLevel: json["win_level"],
  //   pointsWon: json["points_won"],
  //   message: json["message"],
  //   responseCode: json["response_code"],
  // );

  Map<String, dynamic> toJson() => {
    "win_level": winLevel,
    "points_won": pointsWon,
    "message": message,
    "response_code": responseCode,
  };
}
