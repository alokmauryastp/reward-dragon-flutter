// To parse this JSON data, do
//
//     final heartPoints = heartPointsFromJson(jsonString);

import 'dart:convert';

HeartPoints heartPointsFromJson(String str) =>
    HeartPoints.fromJson(json.decode(str));

class HeartPoints {
  HeartPoints({
    this.bucket,
  });

  List<Bucket>? bucket;

  factory HeartPoints.fromJson(Map<String, dynamic> json) => HeartPoints(
        bucket:
            List<Bucket>.from(json["bucket"].map((x) => Bucket.fromJson(x))),
      );
}

class Bucket {
  Bucket({
    required this.startTimeMillis,
    required this.endTimeMillis,
    required this.dataset,
  });

  String startTimeMillis;
  String endTimeMillis;
  List<Dataset> dataset;

  factory Bucket.fromJson(Map<String, dynamic> json) => Bucket(
        startTimeMillis: json["startTimeMillis"],
        endTimeMillis: json["endTimeMillis"],
        dataset:
            List<Dataset>.from(json["dataset"].map((x) => Dataset.fromJson(x))),
      );
}

class Dataset {
  Dataset({
    required this.dataSourceId,
    required this.point,
  });

  String dataSourceId;
  List<Point> point;

  factory Dataset.fromJson(Map<String, dynamic> json) => Dataset(
        dataSourceId: json["dataSourceId"],
        point: List<Point>.from(json["point"].map((x) => Point.fromJson(x))),
      );
}

class Point {
  Point({
    required this.startTimeNanos,
    required this.endTimeNanos,
    required this.dataTypeName,
    required this.value,
  });

  String startTimeNanos;
  String endTimeNanos;
  String dataTypeName;
  List<Value> value;

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        startTimeNanos: json["startTimeNanos"],
        endTimeNanos: json["endTimeNanos"],
        dataTypeName: json["dataTypeName"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );
}

class Value {
  Value({
    required this.fpVal,
    required this.intVal,
  });

  int fpVal;
  int intVal;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        fpVal: json["fpVal"] ?? 0,
        intVal: json["intVal"] ?? 0,
      );
}
