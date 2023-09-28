class AuthResponse {
  bool? status;
  String? message;
  SchoolData? schoolData;
  StudentInfo? studentInfo;
  String? token;

  AuthResponse(
      {this.status,
      this.message,
      this.schoolData,
      this.studentInfo,
      this.token});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    schoolData = json['schoolData'] != null
        ? new SchoolData.fromJson(json['schoolData'])
        : null;
    studentInfo = json['studentInfo'] != null
        ? new StudentInfo.fromJson(json['studentInfo'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.schoolData != null) {
      data['schoolData'] = this.schoolData!.toJson();
    }
    if (this.studentInfo != null) {
      data['studentInfo'] = this.studentInfo!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class SchoolData {
  String? schoolname;
  String? schooladdress;
  String? schoolwebsite;
  String? schoollogo;
  String? themecolor;
  String? contact;
  String? email;
  String? feesurl;

  SchoolData(
      {this.schoolname,
      this.schooladdress,
      this.schoolwebsite,
      this.schoollogo,
      this.themecolor,
      this.contact,
      this.email,
      this.feesurl});

  SchoolData.fromJson(Map<String, dynamic> json) {
    schoolname = json['schoolname'];
    schooladdress = json['schooladdress'];
    schoolwebsite = json['schoolwebsite'];
    schoollogo = json['schoollogo'];
    themecolor = json['themecolor'];
    contact = json['contact'];
    email = json['email'];
    feesurl = json['feesurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolname'] = this.schoolname;
    data['schooladdress'] = this.schooladdress;
    data['schoolwebsite'] = this.schoolwebsite;
    data['schoollogo'] = this.schoollogo;
    data['themecolor'] = this.themecolor;
    data['contact'] = this.contact;
    data['email'] = this.email;
    data['feesurl'] = this.feesurl;
    return data;
  }
}

class StudentInfo {
  String? studentid;
  String? studentName;
  String? gender;
  String? regnumber;
  String? passport;
  String? studentClass;
  String? currentclass;

  StudentInfo(
      {this.studentid,
      this.studentName,
      this.gender,
      this.regnumber,
      this.passport,
      this.studentClass,
      this.currentclass});

  StudentInfo.fromJson(Map<String, dynamic> json) {
    studentid = json['studentid'];
    studentName = json['studentName'];
    gender = json['gender'];
    regnumber = json['regnumber'];
    passport = json['passport'];
    studentClass = json['class'];
    currentclass = json['currentclass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentid'] = this.studentid;
    data['studentName'] = this.studentName;
    data['gender'] = this.gender;
    data['regnumber'] = this.regnumber;
    data['passport'] = this.passport;
    data['class'] = this.studentClass;
    data['currentclass'] = this.currentclass;
    return data;
  }
}
