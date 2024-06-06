
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class Locality {
  final String Function(BuildContext context) name;

  const Locality(this.name);
}

enum LocalityList implements Locality {
  rybnitsa(_rybnitsa),
  tiraspol(_tiraspol),
  dubosary(_dubosary),
  grigariopol(_grigariopol);


  const LocalityList(this.name);

  @override
  final String Function(BuildContext context) name;
}

String _tiraspol(BuildContext context) => S.of(context).tiraspol;

String _rybnitsa(BuildContext context) => S.of(context).rybnitsa;

String _dubosary(BuildContext context) => S.of(context).dubosary;

String _grigariopol(BuildContext context) => S.of(context).grigariopol;


