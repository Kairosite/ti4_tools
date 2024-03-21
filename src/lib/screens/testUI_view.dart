import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ti_calc/constants/colours.dart';
import 'package:ti_calc/fleet_provider.dart';
import 'dart:developer' as developer;

import 'package:ti_calc/unit_data.dart';
import 'package:ti_calc/unit_model.dart';
import 'package:ti_calc/widgets/cost_widgets.dart';
import 'package:ti_calc/widgets/unit_tile.dart';

enum Faction {
  arborec('Arborec', Icons.yard_outlined),
  muaat('Muaat', Icons.local_fire_department_outlined),
  naalu('Naalu', Icons.airplane_ticket_outlined);

  const Faction(this.label, this.icon);
  final String label;
  final IconData icon;
  //can add more eg. faction icon
}

class TestUIView extends StatelessWidget {
  const TestUIView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('CREATE FLEET', style: Theme.of(context).textTheme.headlineLarge,),
      ),
      //backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: Column(children: [
          Container( margin: const EdgeInsets.symmetric(vertical: 10),
            child: DropdownMenu(
              label: const Text('Faction'),
              initialSelection: Faction.arborec,
              dropdownMenuEntries: Faction.values.map((Faction faction) {
                return DropdownMenuEntry<Faction>(
                  value: faction,
                  label: faction.label,
                  leadingIcon: Icon(faction.icon),
                );
              }).toList()
            ),
          ),
          Container( margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ResourceCard(),
              ProdCard()
              ]
            ),
          ),
          Expanded(child: UnitGrid(unitData: unitData)),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const ResetBtn(),
          ),
        ],),
      ),
    );
  }
}

class UnitGrid extends StatelessWidget {
  const UnitGrid({super.key, required this.unitData});
  final List<Unit> unitData;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: MyColour.blue5,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(unitData.length, (index) {
          return UnitTile(
            unit: unitData[index],
          );
        }),
      ),
    );
  }
}

class ResetBtn extends ConsumerWidget {
  const ResetBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      style: FilledButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
      onPressed: () {
        ref.read(fleetProvider.notifier).reset();
      },
      child: const Text('RESET',
        style: TextStyle(
          fontFamily: 'Slider',
          color: Colors.white,
        ),
      ),
    );
  }

}

class BackgroundImg extends StatelessWidget {
  const BackgroundImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: const AssetImage('assets/images/generic_tile_rotate.png'),
      fit: BoxFit.cover,
      alignment: Alignment.center,
      //height: double.infinity,
      //width: double.infinity,
    );
  }

}