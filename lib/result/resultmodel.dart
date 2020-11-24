// To parse this JSON data, do
//
//     final getResultModel = getResultModelFromJson(jsonString);

import 'dart:convert';

GetResultModel getResultModelFromJson(String str) =>
    GetResultModel.fromJson(json.decode(str));

String getResultModelToJson(GetResultModel data) => json.encode(data.toJson());

class GetResultModel {
  GetResultModel({
    this.result,
  });

  Result result;

  factory GetResultModel.fromJson(Map<String, dynamic> json) => GetResultModel(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.id,
    this.studentName,
    this.resultClass,
    this.term,
    this.resultimg,
    this.v,
  });

  String id;
  String studentName;
  String resultClass;
  String term;
  String resultimg;
  int v;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        studentName: json["studentName"],
        resultClass: json["class"],
        term: json["term"],
        resultimg: json["resultimg"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "studentName": studentName,
        "class": resultClass,
        "term": term,
        "resultimg": resultimg,
        "__v": v,
      };
}
