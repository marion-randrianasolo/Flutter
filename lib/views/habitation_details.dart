import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertd/models/habitation.dart';
import 'package:fluttertd/share/location_style.dart';
import 'package:fluttertd/share/location_text_style.dart';
import 'package:fluttertd/views/share/habitation_features_widget.dart';
import 'package:fluttertd/views/share/habitation_option.dart';
import 'package:intl/intl.dart';

class HabitationDetails extends StatefulWidget {
  final Habitation _habitation;
  final OptionPayante _optionPayante;

  const HabitationDetails(this._habitation, this._optionPayante, {Key? key}) : super(key: key);

  @override
  State<HabitationDetails> createState() => _HabitationDetailsState();
}

class _HabitationDetailsState extends State<HabitationDetails> {

  _buildRentButton(){
    var format = NumberFormat("### €");

    return Container(
      decoration: BoxDecoration(
        color: LocationStyle.backgroundColorPurple,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              format.format(widget._habitation.prixmois),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                print('Louer habitation');
              },
              child: Text('Louer'),
            ),
          ),
        ],
      ),
    );
  }

  _buildItems() {
    var width = (MediaQuery.of(context).size.width / 2) - 15;

    return Wrap(
      spacing: 2.0,
      children: Iterable.generate(
        widget._habitation.options.length,
          (i) => Container(
            padding: EdgeInsets.only(left: 15.0),
            margin: EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Text(widget._habitation.libelle),
                  Row(
                    children: [
                      Text(
                        widget._habitation.adresse,
                        style: LocationTextStyle.regularGreyTextStyle,
                      )
                    ],
                  )
                ],
            )
          ),
      ).toList(),
    );
  }

  _buildOptionsPayantes() {
    var width = (MediaQuery.of(context).size.width / 2) - 15;

    return Wrap(
      spacing: 2.0,
      children: Iterable.generate(
        widget._habitation.options.length,
          (i) => Container(
            padding: EdgeInsets.only(left: 15.0),
            margin: EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Text(widget._optionPayante.libelle),
                  Row(
                    children: [
                        Text('${widget._optionPayante.prix} €',
                          style: LocationTextStyle.regularGreyTextStyle,
                        )
                    ],
                  )
                ],
            )
          ),
      ).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._habitation.libelle),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/locations/${widget._habitation.image}',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(widget._habitation.adresse),
          ),
          HabitationFeaturesWidget(widget._habitation),
          _buildItems(),
          _buildOptionsPayantes(),
          _buildRentButton(),
        ],
      ),
    );
  }
}
