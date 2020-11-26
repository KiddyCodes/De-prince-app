class GetNotesModel {
  List<Notes> notes;

  GetNotesModel({this.notes});

  GetNotesModel.fromJson(Map<String, dynamic> json) {
    if (json['notes'] != null) {
      notes = new List<Notes>();
      json['notes'].forEach((v) {
        notes.add(new Notes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notes != null) {
      data['notes'] = this.notes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notes {
  String sId;
  String subject;
  String clss;
  String topic;
  String noteimg;
  int iV;

  Notes({this.sId, this.subject, this.clss, this.topic, this.noteimg, this.iV});

  Notes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subject = json['Subject'];
    clss = json['clss'];
    topic = json['topic'];
    noteimg = json['Noteimg'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Subject'] = this.subject;
    data['clss'] = this.clss;
    data['topic'] = this.topic;
    data['Noteimg'] = this.noteimg;
    data['__v'] = this.iV;
    return data;
  }
}
