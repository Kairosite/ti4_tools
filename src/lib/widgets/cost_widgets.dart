import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import 'package:ti4_tools/fleet_provider.dart';
import 'package:ti4_tools/unit_model.dart';

/// Card widget to display total [Unit] production cost.
///
/// Watches [fleetProvider] for List<Unit> to calculate from
class ResourceCard extends ConsumerWidget {
  const ResourceCard({super.key});

  /// iterate through the given List<Unit> and total each unit production cost
  int calculate(List<Unit> fleet) {
    int total = 0;
    for (Unit unit in fleet) {
      total = total + unit.resource;
    }
    developer.log('ResourceCard: calculate = $total', name: 'MSDevLog');
    return total;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    developer.log('ResourceCard: BUILD', name: 'MSDevLog');
    List<Unit> fleet = ref.watch(fleetProvider);

    return Card(
        color: Colors.amberAccent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(children: [
            const Text('Resources'),
            Text(calculate(fleet).toString())
          ],),
        )
    );
  }
}

/// Card widget to display total [Unit] production cost.
///
/// Watches [fleetProvider] for List<Unit> to calculate from
class ProdCard extends ConsumerWidget {
  const ProdCard({super.key});

  /// iterate through the given List<Unit> and total each unit production cost
  int calculate(List<Unit> fleet) {
    int total = 0;
    for (Unit unit in fleet) {
      total = total + unit.production;
    }
    developer.log('ProdCard: calculate = $total', name: 'MSDevLog');
    return total;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    developer.log('ProdCard: BUILD', name: 'MSDevLog');
    List<Unit> fleet = ref.watch(fleetProvider);

    return Card(
        color: Colors.lightBlueAccent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(children: [
            const Text('Production'),
            Text(calculate(fleet).toString())
          ],),
        )
    );
  }
}