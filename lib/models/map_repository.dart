import 'package:flutter/material.dart';
import 'package:healthcare/models/map.dart';

class MapRepository extends ChangeNotifier {
  final List<Map> _maps = [
    Map(
      nome: 'NAU',
      endereco: 'R. João Negrão, 1072 - Rebouças - Centro, Curitiba - PR',
      foto:
      'https://lh5.googleusercontent.com/p/AF1QipP_xnSi5-sp9slSuMpSx-JlmvwvHGL1VJ_JcOGX=w408-h306-k-no',
      latitude: -15.817095729450202,
      longitude: -47.83720959090759,
    ),
    Map(
      nome: 'Auto Posto Rodoviária',
      endereco: 'Av. Presidente Affonso Camargo 10 - Rebouças, Curitiba - PR',
      foto:
      'https://lh5.googleusercontent.com/p/AF1QipPnfQSsnvt6-VAxF-fUQ0onQCeRktJptOvSL_9F=w408-h306-k-no',
      latitude: -25.435538,
      longitude: -49.2623809,
    ),
    Map(
      nome: 'Auto Posto Nilo Cairo',
      endereco: 'R. Tibagi, 652 - Centro, Curitiba - PR',
      foto:
      'https://lh5.googleusercontent.com/p/AF1QipOB2w7C9Q_NTblNRhcxJtN3-s4_gSjHI1rs5cSM=w408-h544-k-no',
      latitude: -25.435260,
      longitude: -49.2620769,
    ),
  ];

  List<Map> get maps => _maps;
}