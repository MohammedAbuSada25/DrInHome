class TModel {
  TModel({
    this.barCode,
    this.title,
    this.use,
    this.symptomsUse,
    this.components,
    this.image,
    this.usedForDiseases,
  });

  String? barCode;
  String? title;
  String? use;
  String? symptomsUse;
  String? components;
  String? image;
  String? usedForDiseases;

  factory TModel.fromJson(Map<String, dynamic> json) => TModel(
    barCode: json["barCode"] == null ? null : json["barCode"],
    title: json["title"] == null ? null : json["title"],
    use: json["use"] == null ? null : json["use"],
    symptomsUse: json["symptoms_use"] == null ? null : json["symptoms_use"],
    components: json["components"] == null ? null : json["components"],
    image: json["image"] == null ? null : json["image"],
    usedForDiseases: json["used_for_diseases"] == null ? null : json["used_for_diseases"],
  );

  Map<String, dynamic> toJson() => {
    "barCode": barCode == null ? null : barCode,
    "title": title == null ? null : title,
    "use": use == null ? null : use,
    "symptoms_use": symptomsUse == null ? null : symptomsUse,
    "components": components == null ? null : components,
    "image": image == null ? null : image,
    "used_for_diseases": usedForDiseases == null ? null : usedForDiseases,
  };
}
