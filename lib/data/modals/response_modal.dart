import 'dart:developer';

class ResponseModel {
  bool? status;
  int? statusCode;
  String? message;
  // ignore: prefer_typing_uninitialized_variables
  var data;

  ResponseModel({this.status, this.statusCode, this.message, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    return data;
  }
}
