class MerchantSeqModel {
  int? merchantSeq;
  String? merchantid;
  String? merchantType;
  String? merchantName;
  String? merchantAccount;
  String? merchantBank;
  String? merchantContact;
  String? merchantAddress;
  String? merchantPic;
  String? merchantEmail;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  MerchantSeqModel(
      {this.merchantSeq,
      this.merchantid,
      this.merchantType,
      this.merchantName,
      this.merchantAccount,
      this.merchantBank,
      this.merchantContact,
      this.merchantAddress,
      this.merchantPic,
      this.merchantEmail,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  MerchantSeqModel.fromJson(Map<String, dynamic> json) {
    merchantSeq = json['merchant_seq'];
    merchantid = json['merchantid'];
    merchantType = json['merchant_type'];
    merchantName = json['merchant_name'];
    merchantAccount = json['merchant_account'];
    merchantBank = json['merchant_bank'];
    merchantContact = json['merchant_contact'];
    merchantAddress = json['merchant_address'];
    merchantPic = json['merchant_pic'];
    merchantEmail = json['merchant_email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchant_seq'] = merchantSeq;
    data['merchantid'] = merchantid;
    data['merchant_type'] = merchantType;
    data['merchant_name'] = merchantName;
    data['merchant_account'] = merchantAccount;
    data['merchant_bank'] = merchantBank;
    data['merchant_contact'] = merchantContact;
    data['merchant_address'] = merchantAddress;
    data['merchant_pic'] = merchantPic;
    data['merchant_email'] = merchantEmail;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
