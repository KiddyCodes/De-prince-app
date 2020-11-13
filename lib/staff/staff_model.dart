class StaffData {
  // String token;
  String staffName;
  String email;
  String joinedDate;
  String phonenumber;
  String staffId;

  StaffData();

  StaffData.fromJson(Map<String, dynamic> json)
      :
        // token = json['token'],
        staffName = json['staffName'],
        email = json['email'],
        joinedDate = json['joinedDate'],
        phonenumber = json['phonenumber'],
        staffId = json['staffId'];

  Map<String, Object> toJson() => {
        // 'token': token,
        'staffName': staffName,
        'email': email,
        'joinedDate': joinedDate,
        'phonenumber': phonenumber,
        'staffId': staffId
      };
}
