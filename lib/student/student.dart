class UserData {
  String token;
  // String userId;
  String studentName;
  String studentNumber;
  String studentEmail;
  String studentCourse;
  String studentClass;
  String vcode;

  UserData();

  UserData.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        studentEmail = json['email'],
        // userId = json['vendorId'],
        studentClass = json['class'],
        studentNumber = json['phonenumber'],
        studentName = json['studentName'],
        vcode = json['vcode'],
        studentCourse = json['Course'];

  Map<String, Object> toJson() => {
        'token': token,
        'email': studentEmail,
        'class': studentClass,
        'phonenumber': studentNumber,
        'studentName': studentName,
        'Course': studentCourse,
        // 'vendorId': userId,
        'vcode': vcode
      };
}
