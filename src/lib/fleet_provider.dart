import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import 'package:ti_calc/unit_model.dart';

final fleetProvider = StateNotifierProvider<FleetNotifier, List<Unit>>
  ((ref) {
  developer.log('Provider: fleetProvider', name: 'MSDevLog');
  return FleetNotifier();
});

class FleetNotifier extends StateNotifier<List<Unit>> {
  //initialise list of units to an empty list
  FleetNotifier() : super([]);

  void addUnit(Unit unit) {
    developer.log('FleetNotifier: addUnit', name: 'MSDevLog');
    state = [...state, unit];
    developer.log('FleetNotifier: $state', name: 'MSDevLog');
  }
  void removeUnit(String unitName) {
    //TODO: currently removes all instances of same unit
    developer.log('FleetNotifier: removeUnit', name: 'MSDevLog');
    state = [
      for (final unit in state)
        if (unit.title != unitName) unit,
    ];
    developer.log('FleetNotifier: $state', name: 'MSDevLog');
  }

  void reset() {
    state = [];
  }

  int getUnitAmount(Unit unit) {
    return state.where((e) => e == unit).length;
  }
}