import 'package:fluttertd/models/habitation.dart';

class OptionPayanteData {
  static final data = [
    {
      "id": 1,
      "description": "Linge de maison",
      "prix": 20,
    },
    {
      "id": 2,
      "description": "Drap de lit",
      "prix": 30,
    },
    {
      "id": 3,
      "description": "Ménage",
      "prix": 60,
    },
  ];

  static List<OptionPayante> buildList() {
    return data.map((item) => OptionPayante.fromJson(item)).toList();
  }
}