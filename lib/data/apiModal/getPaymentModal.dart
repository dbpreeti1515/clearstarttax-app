class GetPaymentModal {
  bool? status;
  String? message;
  Data? data;

  GetPaymentModal({this.status, this.message, this.data});

  GetPaymentModal.fromJson(Map<String, dynamic> json) {
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
  GetData? data;
  List<PaymentSchedular>? paymentSchedular;
  BillingSummary? billingSummary;
  String? billingSummaryPastDue;
  String? billingSummaryTotalFees;
  String? billingSummaryBalance;
  String? billingSummaryAmountDue;

  Data(
      {this.data,
        this.paymentSchedular,
        this.billingSummary,
        this.billingSummaryPastDue,
        this.billingSummaryTotalFees,
        this.billingSummaryBalance,
        this.billingSummaryAmountDue});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new GetData.fromJson(json['data']) : null;
    if (json['payment_schedular'] != null) {
      paymentSchedular = <PaymentSchedular>[];
      json['payment_schedular'].forEach((v) {
        paymentSchedular!.add(new PaymentSchedular.fromJson(v));
      });
    }
    billingSummary = json['billing_summary'] != null
        ? new BillingSummary.fromJson(json['billing_summary'])
        : null;
    billingSummaryPastDue = json['billing_summary_PastDue'];
    billingSummaryTotalFees = json['billing_summary_TotalFees'];
    billingSummaryBalance = json['billing_summary_Balance'];
    billingSummaryAmountDue = json['billing_summary_AmountDue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.paymentSchedular != null) {
      data['payment_schedular'] =
          this.paymentSchedular!.map((v) => v.toJson()).toList();
    }
    if (this.billingSummary != null) {
      data['billing_summary'] = this.billingSummary!.toJson();
    }
    data['billing_summary_PastDue'] = this.billingSummaryPastDue;
    data['billing_summary_TotalFees'] = this.billingSummaryTotalFees;
    data['billing_summary_Balance'] = this.billingSummaryBalance;
    data['billing_summary_AmountDue'] = this.billingSummaryAmountDue;
    return data;
  }
}

class GetData {
  int? caseID;
  String? firstName;
  String? lastName;
  String? city;
  String? state;
  String? zip;
  String? address;
  String? aptNo;
  String? cellPhone;
  String? email;
  String? pastDue;
  String? balance;

  GetData(
      {this.caseID,
        this.firstName,
        this.lastName,
        this.city,
        this.state,
        this.zip,
        this.address,
        this.aptNo,
        this.cellPhone,
        this.email,
        this.pastDue,
        this.balance});

  GetData.fromJson(Map<String, dynamic> json) {
    caseID = json['CaseID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    city = json['City'];
    state = json['State'];
    zip = json['Zip'];
    address = json['Address'];
    aptNo = json['AptNo'];
    cellPhone = json['CellPhone'];
    email = json['Email'];
    pastDue = json['PastDue'];
    balance = json['Balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CaseID'] = this.caseID;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Zip'] = this.zip;
    data['Address'] = this.address;
    data['AptNo'] = this.aptNo;
    data['CellPhone'] = this.cellPhone;
    data['Email'] = this.email;
    data['PastDue'] = this.pastDue;
    data['Balance'] = this.balance;
    return data;
  }
}

class PaymentSchedular {
  int? caseAmortizationID;
  int? caseID;
  int? amount;
  String? scheduledDate;
  int? createdBy;
  String? createdByUserFullName;
  int? autopayStatusID;
  Null? autoSchedulerList;

  PaymentSchedular(
      {this.caseAmortizationID,
        this.caseID,
        this.amount,
        this.scheduledDate,
        this.createdBy,
        this.createdByUserFullName,
        this.autopayStatusID,
        this.autoSchedulerList});

  PaymentSchedular.fromJson(Map<String, dynamic> json) {
    caseAmortizationID = json['CaseAmortizationID'];
    caseID = json['CaseID'];
    amount = json['Amount'];
    scheduledDate = json['ScheduledDate'];
    createdBy = json['CreatedBy'];
    createdByUserFullName = json['CreatedByUserFullName'];
    autopayStatusID = json['AutopayStatusID'];
    autoSchedulerList = json['AutoSchedulerList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CaseAmortizationID'] = this.caseAmortizationID;
    data['CaseID'] = this.caseID;
    data['Amount'] = this.amount;
    data['ScheduledDate'] = this.scheduledDate;
    data['CreatedBy'] = this.createdBy;
    data['CreatedByUserFullName'] = this.createdByUserFullName;
    data['AutopayStatusID'] = this.autopayStatusID;
    data['AutoSchedulerList'] = this.autoSchedulerList;
    return data;
  }
}

class BillingSummary {
  String? status;
  paymentData? data;
  String? message;

  BillingSummary({this.status, this.data, this.message});

  BillingSummary.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new paymentData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class paymentData {
  int? totalFees;
  int? paidAmount;
  String? paidPercentage;
  int? balance;
  int? amountDue;
  String? dueDate;
  int? pastDue;

  paymentData(
      {this.totalFees,
        this.paidAmount,
        this.paidPercentage,
        this.balance,
        this.amountDue,
        this.dueDate,
        this.pastDue});

  paymentData.fromJson(Map<String, dynamic> json) {
    totalFees = json['TotalFees'];
    paidAmount = json['PaidAmount'];
    paidPercentage = json['PaidPercentage'];
    balance = json['Balance'];
    amountDue = json['AmountDue'];
    dueDate = json['DueDate'];
    pastDue = json['PastDue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalFees'] = this.totalFees;
    data['PaidAmount'] = this.paidAmount;
    data['PaidPercentage'] = this.paidPercentage;
    data['Balance'] = this.balance;
    data['AmountDue'] = this.amountDue;
    data['DueDate'] = this.dueDate;
    data['PastDue'] = this.pastDue;
    return data;
  }
}
