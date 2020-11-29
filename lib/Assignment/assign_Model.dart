class GetAssignmentModel {
  List<Assignment> assignment;

  GetAssignmentModel({this.assignment});

  GetAssignmentModel.fromJson(Map<String, dynamic> json) {
    if (json['assignment'] != null) {
      assignment = new List<Assignment>();
      json['assignment'].forEach((v) {
        assignment.add(new Assignment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assignment != null) {
      data['assignment'] = this.assignment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assignment {
  String sId;
  String subject;
  String clss;
  String topic;
  String questions;
  int iV;

  Assignment(
      {this.sId, this.subject, this.clss, this.topic, this.questions, this.iV});

  Assignment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subject = json['Subject'];
    clss = json['clss'];
    topic = json['topic'];
    questions = json['Questions'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Subject'] = this.subject;
    data['clss'] = this.clss;
    data['topic'] = this.topic;
    data['Questions'] = this.questions;
    data['__v'] = this.iV;
    return data;
  }
}
