import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertd/models/habitation.dart';
import 'package:fluttertd/services/habitation_service.dart';
import 'package:fluttertd/views/habitation_details.dart';
import 'package:fluttertd/views/share/habitation_features_widget.dart';
import 'package:fluttertd/views/share/habitation_option.dart';
import 'package:intl/intl.dart';

class HabitationList extends StatelessWidget {
  final HabitationService service = HabitationService();
  late List<Habitation> _habitations;
  final bool isHouseList;
  late List<OptionPayante> _optionpayantes;

  HabitationList(this.isHouseList, {Key? key})
      : super(key: key) {
    _habitations = isHouseList ?
                      service.getMaisons() :
                      service.getAppartements();
  }


  _buildRow(Habitation habitation, BuildContext context, OptionPayante optionPayante) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HabitationDetails(habitation, optionPayante)),
          );
        },
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images/locations/${habitation.image}',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              _buildDetails(habitation),
            ],
          )
      )
    );
  }

  _buildDetails(Habitation habitation) {
    var format = NumberFormat("### €");
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(habitation.libelle),
                  subtitle: Text(habitation.adresse),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(format.format(habitation.prixmois),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 22,
                ),),
              ),
            ],
          ),
          HabitationFeaturesWidget(habitation),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("Liste des ${this.isHouseList ? 'maisons' : 'appartements'}"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _habitations.length,
          itemBuilder: (context, index) =>
              _buildRow(_habitations[index], context, _optionpayantes[index]),
          itemExtent: 285,
        ),
      ),
    );
  }
}
