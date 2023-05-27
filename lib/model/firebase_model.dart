class ItemFirebase{
  double? temperatura;
  double? pressao;


  ItemFirebase({
    this.temperatura,
    this.pressao
  });

  ItemFirebase.fromJson(Map<String, dynamic> json)
      :temperatura = json['temperatura'], pressao = json['pressao'];

  Map toJson() {
    return {
      'temperatura': temperatura,
      'pressao': pressao,
    };
  }
}
