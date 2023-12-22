class LoginModel {
  String? merchantId;
  String? merchantPin;
  String? deviceName;

  LoginModel({this.merchantId, this.merchantPin, this.deviceName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    merchantId = json['merchantid'];
    merchantPin = json['merchant_pin'];
    deviceName = json['device_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchantid'] = merchantId;
    data['merchant_pin'] = merchantPin;
    data['device_name'] = deviceName;
    return data;
  }
}
