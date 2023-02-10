import 'package:fluttertd/models/habitation.dart';

class OptionData {
  static final data = [
    {
      "id": 1,
      "libelle": "Lac",
      "description": "Base de loisirs à 2km"
    },
    {
      "id": 2,
      "libelle": "Internet",
      "description": "Wifi et fibre"
    }
  ];

  static List<Option> buildList() {
    return data.map((item) => Option.fromJson(item)).toList();
  }
}