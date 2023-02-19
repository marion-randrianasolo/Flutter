import 'package:fluttertd/models/habitation.dart';
import 'package:fluttertd/models/habitations_data.dart';
import 'package:fluttertd/models/option_data.dart';
import 'package:fluttertd/models/optionpayantes_data.dart';
import 'package:fluttertd/models/typehabitat_data.dart';

class HabitationService{
  var _typehabitats;
  var _habitations;
  var _options;
  var _optionpayantes;

  HabitationService(){
    _typehabitats = TypehabitatData.buildList();
    _habitations = HabitationsData.buildList();
    _options = OptionData.buildList();
    _optionpayantes = OptionPayanteData.buildList();
  }

  List<TypeHabitat> getTypeHabitats() {
    return _typehabitats;
  }

 List<Habitation> getHabitationTop10() {
    return _habitations
        .where((element) => element.id%2 == 1)
        .take(10)
        .toList();
 }

 List<Habitation> getMaisons(){
    return _getHabitations(isHouse: true);
 }

 List<Habitation> getAppartements(){
    return _getHabitations(isHouse: true);
 }

 List<Habitation> _getHabitations({bool isHouse = true}) {
    return _habitations
        .where((element) => element.typeHabitat.id == (isHouse ? 1 : 2))
        .toList();
 }

 List<Option> getOptions() {
    return _options;
 }

 List<OptionPayante> getOptionPayantes() {
    return _optionpayantes;
 }

}