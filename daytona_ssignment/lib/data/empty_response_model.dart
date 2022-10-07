import 'package:daytona_ssignment/domain/entity/model.dart';

class EmptyResponseModel extends Models<EmptyResponseModel> {
  int? code;
  String? msg;

  EmptyResponseModel({this.code, this.msg});
  @override
  EmptyResponseModel fromJson(json) {
    //Map<String, dynamic>
    return EmptyResponseModel(
      code: json['code'],
      msg: json['msg'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;

    return data;
  }
}

/* class Response {
  Response.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
} */
