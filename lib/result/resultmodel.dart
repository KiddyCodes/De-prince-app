class GetResultModel {
  List<Result> result;

  GetResultModel({this.result});

  GetResultModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String sId;
  String studentName;
  String clss;
  String term;
  String resultimg;
  int iV;

  Result(
      {this.sId,
      this.studentName,
      this.clss,
      this.term,
      this.resultimg,
      this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentName = json['studentName'];
    clss = json['clss'];
    term = json['term'];
    resultimg = json['resultimg'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['studentName'] = this.studentName;
    data['clss'] = this.clss;
    data['term'] = this.term;
    data['resultimg'] = this.resultimg;
    data['__v'] = this.iV;
    return data;
  }
}
