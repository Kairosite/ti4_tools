import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import 'package:ti_calc/fleet_provider.dart';
import 'package:ti_calc/unit_model.dart';


class UnitTable extends StatelessWidget {
  const UnitTable({super.key, required this.unitData});

  final List<Unit> unitData;

  TableRow header() {
    return TableRow(
        children: [
          Container(alignment: Alignment.center, child: const Text('Unit')),
          Container(alignment: Alignment.center, child: const Text('Cost')),
          Container(alignment: Alignment.center, child: const Text('Production')),
          Container(alignment: Alignment.center, child: const Text('')),
        ]
    );
  }
  List<TableRow> body(unitData) {
    List<TableRow> data = [];
    for (Unit unit in unitData) {
      data.add(
          TableRow(
              children: [
                Container(alignment: Alignment.center,
                    child: Text(unit.title)),
                Container(alignment: Alignment.center,
                    child: Text((unit.resource).toString())),
                Container(alignment: Alignment.center,
                    child: Text((unit.production).toString())),
                IncrementBtn(unit: unit),
              ]
          )
      );
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(inside: const BorderSide(), outside: BorderSide.none),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(1),
      },
      children: [header()] + body(unitData),
    );
  }
}

class IncrementBtn extends ConsumerWidget {
  const IncrementBtn({super.key, required this.unit,});
  final Unit unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TableCell(
      child: IconButton(
        onPressed: () {
          developer.log('IncrementBtn: onPressed', name: 'MSDevLog');
          ref.read(fleetProvider.notifier).addUnit(unit);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}

