// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    this.type,
    this.query,
    this.features,
    this.attribution,
  });

  String type;
  List<String> query;
  List<Feature> features;
  String attribution;

  SearchResponse copyWith({
    String type,
    List<String> query,
    List<Feature> features,
    String attribution,
  }) =>
      SearchResponse(
        type: type ?? this.type,
        query: query ?? this.query,
        features: features ?? this.features,
        attribution: attribution ?? this.attribution,
      );

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        type: json["type"] == null ? null : json["type"],
        query: json["query"] == null
            ? null
            : List<String>.from(json["query"].map((x) => x)),
        features: json["features"] == null
            ? null
            : List<Feature>.from(
                json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"] == null ? null : json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "query": query == null ? null : List<dynamic>.from(query.map((x) => x)),
        "features": features == null
            ? null
            : List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution == null ? null : attribution,
      };
}

class Feature {
  Feature({
    this.id,
    this.type,
    this.placeType,
    this.relevance,
    this.properties,
    this.textEs,
    this.languageEs,
    this.placeNameEs,
    this.text,
    this.language,
    this.placeName,
    this.matchingText,
    this.matchingPlaceName,
    this.bbox,
    this.center,
    this.geometry,
    this.context,
  });

  String id;
  String type;
  List<String> placeType;
  double relevance;
  Properties properties;
  String textEs;
  Language languageEs;
  String placeNameEs;
  String text;
  Language language;
  String placeName;
  String matchingText;
  String matchingPlaceName;
  List<double> bbox;
  List<double> center;
  Geometry geometry;
  List<Context> context;

  Feature copyWith({
    String id,
    String type,
    List<String> placeType,
    double relevance,
    Properties properties,
    String textEs,
    Language languageEs,
    String placeNameEs,
    String text,
    Language language,
    String placeName,
    String matchingText,
    String matchingPlaceName,
    List<double> bbox,
    List<double> center,
    Geometry geometry,
    List<Context> context,
  }) =>
      Feature(
        id: id ?? this.id,
        type: type ?? this.type,
        placeType: placeType ?? this.placeType,
        relevance: relevance ?? this.relevance,
        properties: properties ?? this.properties,
        textEs: textEs ?? this.textEs,
        languageEs: languageEs ?? this.languageEs,
        placeNameEs: placeNameEs ?? this.placeNameEs,
        text: text ?? this.text,
        language: language ?? this.language,
        placeName: placeName ?? this.placeName,
        matchingText: matchingText ?? this.matchingText,
        matchingPlaceName: matchingPlaceName ?? this.matchingPlaceName,
        bbox: bbox ?? this.bbox,
        center: center ?? this.center,
        geometry: geometry ?? this.geometry,
        context: context ?? this.context,
      );

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        placeType: json["place_type"] == null
            ? null
            : List<String>.from(json["place_type"].map((x) => x)),
        relevance:
            json["relevance"] == null ? null : json["relevance"].toDouble(),
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
        textEs: json["text_es"] == null ? null : json["text_es"],
        languageEs: json["language_es"] == null
            ? null
            : languageValues.map[json["language_es"]],
        placeNameEs:
            json["place_name_es"] == null ? null : json["place_name_es"],
        text: json["text"] == null ? null : json["text"],
        language: json["language"] == null
            ? null
            : languageValues.map[json["language"]],
        placeName: json["place_name"] == null ? null : json["place_name"],
        matchingText:
            json["matching_text"] == null ? null : json["matching_text"],
        matchingPlaceName: json["matching_place_name"] == null
            ? null
            : json["matching_place_name"],
        bbox: json["bbox"] == null
            ? null
            : List<double>.from(json["bbox"].map((x) => x.toDouble())),
        center: json["center"] == null
            ? null
            : List<double>.from(json["center"].map((x) => x.toDouble())),
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        context: json["context"] == null
            ? null
            : List<Context>.from(
                json["context"].map((x) => Context.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "place_type": placeType == null
            ? null
            : List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance == null ? null : relevance,
        "properties": properties == null ? null : properties.toJson(),
        "text_es": textEs == null ? null : textEs,
        "language_es":
            languageEs == null ? null : languageValues.reverse[languageEs],
        "place_name_es": placeNameEs == null ? null : placeNameEs,
        "text": text == null ? null : text,
        "language": language == null ? null : languageValues.reverse[language],
        "place_name": placeName == null ? null : placeName,
        "matching_text": matchingText == null ? null : matchingText,
        "matching_place_name":
            matchingPlaceName == null ? null : matchingPlaceName,
        "bbox": bbox == null ? null : List<dynamic>.from(bbox.map((x) => x)),
        "center":
            center == null ? null : List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry == null ? null : geometry.toJson(),
        "context": context == null
            ? null
            : List<dynamic>.from(context.map((x) => x.toJson())),
      };
}

class Context {
  Context({
    this.id,
    this.wikidata,
    this.shortCode,
    this.textEs,
    this.languageEs,
    this.text,
    this.language,
  });

  String id;
  String wikidata;
  String shortCode;
  String textEs;
  Language languageEs;
  String text;
  Language language;

  Context copyWith({
    String id,
    String wikidata,
    String shortCode,
    String textEs,
    Language languageEs,
    String text,
    Language language,
  }) =>
      Context(
        id: id ?? this.id,
        wikidata: wikidata ?? this.wikidata,
        shortCode: shortCode ?? this.shortCode,
        textEs: textEs ?? this.textEs,
        languageEs: languageEs ?? this.languageEs,
        text: text ?? this.text,
        language: language ?? this.language,
      );

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: json["id"] == null ? null : json["id"],
        wikidata: json["wikidata"] == null ? null : json["wikidata"],
        shortCode: json["short_code"] == null ? null : json["short_code"],
        textEs: json["text_es"] == null ? null : json["text_es"],
        languageEs: json["language_es"] == null
            ? null
            : languageValues.map[json["language_es"]],
        text: json["text"] == null ? null : json["text"],
        language: json["language"] == null
            ? null
            : languageValues.map[json["language"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "wikidata": wikidata == null ? null : wikidata,
        "short_code": shortCode == null ? null : shortCode,
        "text_es": textEs == null ? null : textEs,
        "language_es":
            languageEs == null ? null : languageValues.reverse[languageEs],
        "text": text == null ? null : text,
        "language": language == null ? null : languageValues.reverse[language],
      };
}

enum Language { ES }

final languageValues = EnumValues({"es": Language.ES});

class Geometry {
  Geometry({
    this.type,
    this.coordinates,
  });

  String type;
  List<double> coordinates;

  Geometry copyWith({
    String type,
    List<double> coordinates,
  }) =>
      Geometry(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
      );

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"] == null ? null : json["type"],
        coordinates: json["coordinates"] == null
            ? null
            : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "coordinates": coordinates == null
            ? null
            : List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Properties {
  Properties({
    this.wikidata,
    this.foursquare,
    this.landmark,
    this.address,
    this.category,
  });

  String wikidata;
  String foursquare;
  bool landmark;
  String address;
  String category;

  Properties copyWith({
    String wikidata,
    String foursquare,
    bool landmark,
    String address,
    String category,
  }) =>
      Properties(
        wikidata: wikidata ?? this.wikidata,
        foursquare: foursquare ?? this.foursquare,
        landmark: landmark ?? this.landmark,
        address: address ?? this.address,
        category: category ?? this.category,
      );

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        wikidata: json["wikidata"] == null ? null : json["wikidata"],
        foursquare: json["foursquare"] == null ? null : json["foursquare"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        address: json["address"] == null ? null : json["address"],
        category: json["category"] == null ? null : json["category"],
      );

  Map<String, dynamic> toJson() => {
        "wikidata": wikidata == null ? null : wikidata,
        "foursquare": foursquare == null ? null : foursquare,
        "landmark": landmark == null ? null : landmark,
        "address": address == null ? null : address,
        "category": category == null ? null : category,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
