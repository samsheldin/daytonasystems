import 'package:daytona_ssignment/domain/entity/model.dart';

class DetailsModel extends Models<DetailsModel> {
  String? get;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  List<Response>? response;

  DetailsModel(
      {this.get, this.parameters, this.errors, this.results, this.response});

  @override
  DetailsModel fromJson(Map<String, dynamic> json) {
    List<dynamic>? e = [];
    if (json['errors'] != null) {
      json['errors'].forEach((v) {
        e.add(v);
      });
    }
    List<Response>? n = [];
    if (json['response'] != null) {
      json['response'].forEach((v) {
        n.add(Response.fromJson(v));
      });
    }
    return DetailsModel(
        get: json['get'],
        parameters: json['parameters'] != null
            ? Parameters.fromJson(json['parameters'])
            : null,
        errors: e,
        results: json['results'],
        response: n);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['get'] = get;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    data['results'] = results;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? country;

  Parameters({this.country});

  Parameters.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    return data;
  }
}

class Response {
  String? continent;
  String? country;
  int? population;
  Cases? cases;
  Deaths? deaths;
  Tests? tests;
  String? day;
  String? time;

  Response(
      {this.continent,
      this.country,
      this.population,
      this.cases,
      this.deaths,
      this.tests,
      this.day,
      this.time});

  Response.fromJson(Map<String, dynamic> json) {
    continent = json['continent'];
    country = json['country'];
    population = json['population'];
    cases = json['cases'] != null ? Cases.fromJson(json['cases']) : null;
    deaths = json['deaths'] != null ? Deaths.fromJson(json['deaths']) : null;
    tests = json['tests'] != null ? Tests.fromJson(json['tests']) : null;
    day = json['day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['continent'] = continent;
    data['country'] = country;
    data['population'] = population;
    if (cases != null) {
      data['cases'] = cases!.toJson();
    }
    if (deaths != null) {
      data['deaths'] = deaths!.toJson();
    }
    if (tests != null) {
      data['tests'] = tests!.toJson();
    }
    data['day'] = day;
    data['time'] = time;
    return data;
  }
}

class Cases {
  String? ne;
  int? active;
  int? critical;
  int? recovered;
  String? s1MPop;
  int? total;

  Cases(
      {this.ne,
      this.active,
      this.critical,
      this.recovered,
      this.s1MPop,
      this.total});

  Cases.fromJson(Map<String, dynamic> json) {
    ne = json['new'];
    active = json['active'];
    critical = json['critical'];
    recovered = json['recovered'];
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['new'] = ne;
    data['active'] = active;
    data['critical'] = critical;
    data['recovered'] = recovered;
    data['1M_pop'] = s1MPop;
    data['total'] = total;
    return data;
  }
}

class Deaths {
  dynamic ne;
  String? s1MPop;
  int? total;

  Deaths({this.ne, this.s1MPop, this.total});

  Deaths.fromJson(Map<String, dynamic> json) {
    ne = json['new'];
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['new'] = ne;
    data['1M_pop'] = s1MPop;
    data['total'] = total;
    return data;
  }
}

class Tests {
  String? s1MPop;
  int? total;

  Tests({this.s1MPop, this.total});

  Tests.fromJson(Map<String, dynamic> json) {
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1M_pop'] = s1MPop;
    data['total'] = total;
    return data;
  }
}
