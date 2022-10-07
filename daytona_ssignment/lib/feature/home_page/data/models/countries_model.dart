import 'package:daytona_ssignment/domain/entity/model.dart';

class CountriesModel extends Models<CountriesModel> {
  String? get;
  List<dynamic>? parameters;
  List<dynamic>? errors;
  int? results;
  List<String>? response;

  CountriesModel(
      {this.get, this.parameters, this.errors, this.results, this.response});

  @override
  CountriesModel fromJson(Map<String, dynamic> json) {
    List<dynamic>? p = [];
    if (json['parameters'] != null) {
      json['parameters'].forEach((v) {
        p.add(v);
      });
    }
    List<dynamic>? e = [];
    if (json['errors'] != null) {
      json['errors'].forEach((v) {
        e.add(v);
      });
    }
    List<String>? n = [];
    if (json['response'] != null) {
      json['response'].forEach((v) {
        n.add((v as String?) ?? "");
      });
    }
    return CountriesModel(
        get: json['get'],
        parameters: p,
        errors: e,
        results: json['results'],
        response: n);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['get'] = get;
    if (parameters != null) {
      data['parameters'] = parameters!.map((v) => v.toJson()).toList();
    }
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    data['results'] = results;
    data['response'] = response;
    return data;
  }
}
