class ResultData {
  String token;
  // String userId;
  String studentName;
  String studentClass;
  String studentTerm;
  String studentResult;

  ResultData();

  ResultData.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        studentClass = json['class'],
        studentTerm = json['term'],
        studentName = json['studentName'],
        studentResult = json['resultimg'];

  Map<String, Object> toJson() => {
        'token': token,
        'term': studentTerm,
        'class': studentClass,
        'studentName': studentName,
        'resultimg': studentResult,
      };
}
