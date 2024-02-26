class GetDashBoardModel {
  bool? status;
  String? message;
  Data? data;

  GetDashBoardModel({this.status, this.message, this.data});

  GetDashBoardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? greeting;
  int? statusId;
  String? statusName;
  Statusinfo? statusinfo;
  List<String>? statusForFq;
  List<String>? statusForTo;
  List<String>? statusForAppointment;

  Data(
      {this.greeting,
        this.statusId,
        this.statusName,
        this.statusinfo,
        this.statusForFq,
        this.statusForTo,
        this.statusForAppointment});

  Data.fromJson(Map<String, dynamic> json) {
    greeting = json['greeting'];
    statusId = json['status_id'];
    statusName = json['status_name'];
    statusinfo = json['statusinfo'] != null
        ? new Statusinfo.fromJson(json['statusinfo'])
        : null;
    statusForFq = json['status_for_fq'].cast<String>();
    statusForTo = json['status_for_to'].cast<String>();
    statusForAppointment = json['status_for_appointment'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['greeting'] = this.greeting;
    data['status_id'] = this.statusId;
    data['status_name'] = this.statusName;
    if (this.statusinfo != null) {
      data['statusinfo'] = this.statusinfo!.toJson();
    }
    data['status_for_fq'] = this.statusForFq;
    data['status_for_to'] = this.statusForTo;
    data['status_for_appointment'] = this.statusForAppointment;
    return data;
  }
}

class Statusinfo {
  int? id;
  String? status;
  String? statusCode;
  String? whatThisMeans;
  String? whatHappensNext;
  String? createdAt;
  Null? updatedAt;

  Statusinfo(
      {this.id,
        this.status,
        this.statusCode,
        this.whatThisMeans,
        this.whatHappensNext,
        this.createdAt,
        this.updatedAt});

  Statusinfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    statusCode = json['status_code'];
    whatThisMeans = json['what_this_means'];
    whatHappensNext = json['what_happens_next'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['what_this_means'] = this.whatThisMeans;
    data['what_happens_next'] = this.whatHappensNext;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
