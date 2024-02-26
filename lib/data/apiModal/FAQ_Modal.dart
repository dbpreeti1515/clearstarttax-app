class FAQ_Modal {
  bool? status;
  String? message;
  Data? data;

  FAQ_Modal({this.status, this.message, this.data});

  FAQ_Modal.fromJson(Map<String, dynamic> json) {
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
  List<ProcessingFaqs>? processingFaqs;
  List<ServiceFaqs>? serviceFaqs;

  Data({this.processingFaqs, this.serviceFaqs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['processing_faqs'] != null) {
      processingFaqs = <ProcessingFaqs>[];
      json['processing_faqs'].forEach((v) {
        processingFaqs!.add(new ProcessingFaqs.fromJson(v));
      });
    }
    if (json['service_faqs'] != null) {
      serviceFaqs = <ServiceFaqs>[];
      json['service_faqs'].forEach((v) {
        serviceFaqs!.add(new ServiceFaqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.processingFaqs != null) {
      data['processing_faqs'] =
          this.processingFaqs!.map((v) => v.toJson()).toList();
    }
    if (this.serviceFaqs != null) {
      data['service_faqs'] = this.serviceFaqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProcessingFaqs {
  int? id;
  String? question;
  String? answer;
  String? type;
  String? createdAt;
  Null? updatedAt;

  ProcessingFaqs(
      {this.id,
        this.question,
        this.answer,
        this.type,
        this.createdAt,
        this.updatedAt});

  ProcessingFaqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class ServiceFaqs {
  int? id;
  String? question;
  String? answer;
  String? type;
  String? createdAt;
  Null? updatedAt;

  ServiceFaqs(
      {this.id,
        this.question,
        this.answer,
        this.type,
        this.createdAt,
        this.updatedAt});

  ServiceFaqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
