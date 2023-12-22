class MerchantRedeemedModel {
  int? id;
  String? studentName;
  String? studentId;
  int? merchantSeq;
  String? merchantName;
  String? csName;
  String? usageDate;
  double? csValue;
  int? couponUsed;
  String? couponCode;
  String? createdAt;
  String? updatedAt;

  MerchantRedeemedModel(
      {this.id,
      this.studentName,
      this.studentId,
      this.merchantSeq,
      this.merchantName,
      this.csName,
      this.usageDate,
      this.csValue,
      this.couponUsed,
      this.couponCode,
      this.createdAt,
      this.updatedAt});

  MerchantRedeemedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student_name'];
    studentId = json['student_id'];
    merchantSeq = json['merchant_seq'];
    merchantName = json['merchant_name'];
    csName = json['cs_name'];
    usageDate = json['usage_date'];
    csValue = json['cs_value'];
    couponUsed = json['couponused'];
    couponCode = json['couponcode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_name'] = studentName;
    data['student_id'] = studentId;
    data['merchant_seq'] = merchantSeq;
    data['merchant_name'] = merchantName;
    data['cs_name'] = csName;
    data['usage_date'] = usageDate;
    data['cs_value'] = csValue;
    data['couponused'] = couponUsed;
    data['couponcode'] = couponCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
