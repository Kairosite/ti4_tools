import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import 'package:ti_calc/fleet_provider.dart';
import 'package:ti_calc/unit_model.dart';


class FleetList extends ConsumerWidget {
  const FleetList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    developer.log('FleetList: BUILD', name: 'MSDevLog');
    List<Unit> fleetData = ref.watch(fleetProvider);

    return Expanded(
      child: ListView.builder(
        itemCount: fleetData.length,
        itemBuilder: (context, index) {
          return Card (
            child: ListTile(
              title: Text(fleetData[index].title),
              leading: Text('${fleetData[index].production} : ${fleetData[index].resource}'),
              trailing: DecrementBtn(unit: fleetData[index]),
              tileColor: Theme.of(context).primaryColorLight,
            ),
          );
        },
      ),
    );
  }
}

class DecrementBtn extends ConsumerWidget {
  const DecrementBtn({super.key, required this.unit});
  final Unit unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        developer.log('DecrementBtn: onPressed', name: 'MSDevLog');
        ref.read(fleetProvider.notifier).removeUnit(unit.title);
      },
      icon: const Icon(Icons.remove),
    );
  }
}